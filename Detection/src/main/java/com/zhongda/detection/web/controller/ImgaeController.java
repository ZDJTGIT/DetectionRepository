package com.zhongda.detection.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.zhongda.detection.web.model.Image;
import com.zhongda.detection.web.model.Result;
import com.zhongda.detection.web.service.ImageService;
import com.zhongda.detection.web.service.ProjectService;

@RestController
@RequestMapping(value = "/image")
public class ImgaeController {
	
	@Resource
	private ImageService imageService;
	
	@Autowired
	private ProjectService projectService;
	
	/**
	 * 单个图片上传
	 * @param file
	 * @param imageId
	 * @return
	 */
	@RequestMapping(value="/uploadSingleImage", method = RequestMethod.POST)
	@ResponseBody
	public Result<String> uploadSingleImage(@RequestParam(value = "file") MultipartFile file, Integer imageId){	
		Result<String> result = imageService.uploadSingleImage(file, imageId);
		return result;
	}
	
	/**
	 * 多个图片上传
	 * @param file
	 * @param imageId
	 * @return
	 */
	@RequestMapping(value="/uploadMultipleImage", method = RequestMethod.POST)
	@ResponseBody
	public Result<String> uploadMultipleImage(@RequestParam(value = "file") MultipartFile file, Integer imageId){
		Result<String> result = imageService.uploadMultipleImage(file, imageId);
		return result;
	}
	
	/**
	 * 更新物理图的Url路径
	 * @param imageId
	 * @return
	 */
	@RequestMapping(value="/updatePhysicalUrl", method = RequestMethod.GET)
	public Image updatePhysicalUrl(Integer imageId){
		return imageService.updatePhysicalUrl(imageId);
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
	 * 添加图片记录
	 * @param image
	 * @return
	 */
	@RequestMapping(value = "/addImage", method = RequestMethod.POST)
	@ResponseBody
	public Image addImage(@RequestBody Image image){			
		imageService.insertSelective(image);
		return image;
	}
}
