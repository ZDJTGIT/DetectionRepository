package com.zhongda.detection.web.service.impl;
import java.io.File;
import java.net.InetAddress;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.zhongda.detection.core.utils.JschRemote;
import com.zhongda.detection.web.dao.ImageMapper;
import com.zhongda.detection.web.model.Image;
import com.zhongda.detection.web.model.Result;
import com.zhongda.detection.web.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService {
	
	private String basePath = "/usr/local/nginx/html/Detection/mnt/upload";
	
	@Resource
	private ImageMapper imageMapper;
	
	@Resource(name = "shiroEhcacheManager")
	private CacheManager cacheManager;
	private Cache<Integer, Image> multipleImageCache;

	@Override
	public Image selectImageByTwoId(Integer projectId, Integer detectionTypeId) {
		return imageMapper.selectImageByTwoId(projectId, detectionTypeId);
	}

	public List<Image> selectImageByProjectId(Integer projectId) {
		return imageMapper.selectImageByProjectId(projectId);
	}

	@Override
	public int insertSelective(Image record) {
		return imageMapper.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(Image record) {
		return imageMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public void removeImage(String imageUrl) {
		try {
			String[] imageUrlSplit = imageUrl.split("/");
			if(imageUrlSplit.length != 5){
				return;
			}
			String directory = basePath + "/" + imageUrlSplit[2] + "/" +imageUrlSplit[3];
			String ip = InetAddress.getLocalHost().getHostAddress();
			System.out.println(ip);
			if(!"123.207.39.209".endsWith(ip)){		        
				synchronized (this) {
					JschRemote.connect();
					JschRemote.delete(directory, imageUrlSplit[4]);
					JschRemote.close();
				}				
			}else{						        
		        //基础路径+一级目录+二级目录
				File targetFile = new File(directory, imageUrlSplit[4]);
		        targetFile.delete();  
			}
		} catch (Exception e) {		
			e.printStackTrace();	
		}		
	}

	@Override
	public Result uploadImage(MultipartFile file) {
		Result result = new Result();
		try {			
	        String fileName = file.getOriginalFilename();
	        // 新的图片名称
	        String newFileName = UUID.randomUUID() + fileName.substring(fileName.lastIndexOf("."));     
	        int hashCode=fileName.hashCode();
	        String dir1=Integer.toHexString(hashCode&0XF);//计算第一级目录
	        String dir2=Integer.toHexString((hashCode>>4)&0XF);//计算第二级目录
			
			String ip = InetAddress.getLocalHost().getHostAddress();
			System.out.println(ip);
			if(!"123.207.39.209".endsWith(ip)){					        
		        //一级目录+二级目录
		        String otherDirectory = dir1 + "/" + dir2;
				synchronized (this) {
					JschRemote.connect();
					JschRemote.upload(basePath, otherDirectory, file, newFileName);
					JschRemote.close();
				}				
			}else{						        
		        //基础路径+一级目录+二级目录
				File dirFile = new File(basePath, dir1 + "/" + dir2);
		        File targetFile = new File(dirFile, newFileName);  
		        if(!targetFile.exists()){  
		            targetFile.mkdirs();  
		        }  
		        try {
		        	// 将内存中的数据写入磁盘
		            file.transferTo(targetFile);  
		        } catch (Exception e) {  
		            e.printStackTrace();  
		        }		       				
			}
			result.setCode(Result.SUCCESS);
			result.setMsg("上传成功");			
			result.setData("mnt/upload/"+dir1 + "/" + dir2+"/"+newFileName);
		} catch (Exception e) {		
			e.printStackTrace();
			result.setCode(Result.FAILURE);
			result.setMsg("上传失败(获取IP地址失败)");
		}		
		return result;
	}

	@Override
	public Result uploadSingleImage(MultipartFile file, Integer imageId) {
		//上传图片至服务器
		Result result = uploadImage(file);
		//删除服务器上的图片
		Image image = imageMapper.selectByPrimaryKey(imageId);
		if(null != image && null != image.getHeatImageUrl()){
			removeImage(image.getHeatImageUrl());
		}	
		//如果上传成功，则更新图片路径Url
		if(result.getCode() == Result.SUCCESS){
			image = new Image(imageId);
			image.setHeatImageUrl(result.getData().toString());
			imageMapper.updateByPrimaryKeySelective(image);
		}
		return result;
	}

	@Override
	public Result uploadMultipleImage(MultipartFile file, Integer imageId) {
		//上传图片至服务器
		Result result = uploadImage(file);
		//如果上传成功，则将该图片路径Url添加至缓存
		if(result.getCode() == Result.SUCCESS){
			multipleImageCache = cacheManager.getCache("multipleImageCache");
			Image image = multipleImageCache.get(imageId);
			if(null == image){
				image = new Image(imageId);
				multipleImageCache.put(imageId, image);
			}
			String physicalImageUrl = image.getPhysicalImageUrl();
			if(null == physicalImageUrl || physicalImageUrl.trim().equals("")){
				physicalImageUrl = result.getData().toString();
			}else{
				physicalImageUrl = physicalImageUrl + "," + result.getData().toString();
			}
			image.setPhysicalImageUrl(physicalImageUrl);
		}
		return result;
	}

	@Override
	public Image updatePhysicalUrl(Integer imageId) {
		//删除服务器上的图片
		Image image = imageMapper.selectByPrimaryKey(imageId);
		if(null != image && null != image.getPhysicalImageUrl()){
			String[] imgUrls = image.getPhysicalImageUrl().split(",");
			for (String imgUrl : imgUrls) {
				removeImage(imgUrl);
			}
		}	
		try {
			//获取缓存中的图片路径
			multipleImageCache = cacheManager.getCache("multipleImageCache");
			image = multipleImageCache.get(imageId);
			imageMapper.updateByPrimaryKeySelective(image);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			multipleImageCache.remove(imageId);
		}	
		return image;
	}

	@Override
	public Result delateImageByProjectId(Integer projectId) {
		Result result = new Result();
		List<Image>  imageList = imageMapper.selectImageByProjectId(projectId);
		for(Image image :imageList){
			if(null != image){
				if(null != image.getHeatImageUrl() && !"".equals(image.getHeatImageUrl().trim())){
					//删除服务器上的热点图片
					removeImage(image.getHeatImageUrl());
				}
				if(null != image.getPhysicalImageUrl() && !"".equals(image.getPhysicalImageUrl().trim())){
					//删除服务器上的物理图片
					String[] imgUrls = image.getPhysicalImageUrl().split(",");
					for (String imgUrl : imgUrls) {
						removeImage(imgUrl);
					}
				}
			}
		}
		result.setCode(Result.SUCCESS);
		result.setMsg("删除成功");
		return result;
	}

	@Override
	public int deleteByProjectId(Integer projectId) {
		return imageMapper.deleteByProjectId(projectId);
	}
}
