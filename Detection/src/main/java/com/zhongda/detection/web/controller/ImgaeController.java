package com.zhongda.detection.web.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.zhongda.detection.web.model.Image;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.ImageService;

@RestController
@RequestMapping(value = "/image")
public class ImgaeController {
	
	@Resource
	private ImageService imageService;
	
	/**
	 * 上传图片
	 */
	@RequestMapping(value="/uploadImg", method = RequestMethod.POST)
	public String uploadImg(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request){
		
		//基础路径     
		String path = "/usr/local/nginx/html/Detection/mnt/upload";		
        String fileName = file.getOriginalFilename();
        // 新的图片名称
        String newFileName = UUID.randomUUID() + fileName.substring(fileName.lastIndexOf("."));     
        int hashCode=fileName.hashCode();
        String dir1=Integer.toHexString(hashCode&0XF);//计算第一级目录
        String dir2=Integer.toHexString((hashCode>>4)&0XF);//计算第二级目录
        //基础路径+一级目录+二级目录
		File dirFile = new File(path, dir1 + "/" + dir2);
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
		return "{\"code\":\"0\",\"path\":\"mnt/upload/"+dir1 + "/" + dir2+"/"+newFileName+"\"}";
	}
	
	
	/**
	 * 查项目ID下所有图片
	 */
	@RequestMapping(value = "/showProjectImaged", method = RequestMethod.POST)
	@ResponseBody
	public List<Image> showProjectImaged(Integer projectId){
		return imageService.selectByProjectId(projectId);
	}
	
	/**
	 * 修改图片
	 */
	@RequestMapping(value = "/updetaImage", method = RequestMethod.POST)
	@ResponseBody
	public Image updetaImage(@RequestBody Image image){
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
		imageService.updateByPrimaryKeySelective(image);
		return image;
		}else{
			return null;
		}
	}
	
}
