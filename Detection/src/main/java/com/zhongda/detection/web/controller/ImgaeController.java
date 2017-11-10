package com.zhongda.detection.web.controller;

import java.util.List;

import javax.annotation.Resource;

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
import com.zhongda.detection.web.model.Result;
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
	@ResponseBody
	public Result uploadImg(@RequestParam(value = "file", required = false) MultipartFile file){
		Result result = imageService.uploadImage(file);
		return result;
	}	
	
	/**
	 * 查项目下所有图片
	 * @param projectId 对应项目的项目id
	 * @return 图片集合
	 */
	@RequestMapping(value = "/showProjectImage", method = RequestMethod.POST)
	@ResponseBody
	public List<Image> showProjectImage(Integer projectId){
		return imageService.selectImageByProjectId(projectId);
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
	
	/**
	 * 删除具体的图片
	 */
	@RequestMapping(value = "/removeImage", method = RequestMethod.GET)
	@ResponseBody
	public void removeImage(String imageUrl){
		imageService.removeImage(imageUrl);
	}
	
}
