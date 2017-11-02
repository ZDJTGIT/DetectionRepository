package com.zhongda.detection.web.controller;

import java.io.File;
import java.util.List;

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
		
		System.out.println("开始");  
        String path = request.getSession().getServletContext().getRealPath("assets/upload");
        System.out.println(path);
        String fileName = file.getOriginalFilename();
//        System.out.println(fileName);
//        String[] fileNameArray = fileName.split(".");
//        System.out.println(fileNameArray.length);
//        fileName = new Date().getTime()+fileNameArray[fileNameArray.length-1]; 
        System.out.println(fileName);
        File targetFile = new File(path, fileName);  
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
        //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
		return "{\"code\":\"0\",\"path\":\"assets/upload/"+fileName+"\"}";
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
