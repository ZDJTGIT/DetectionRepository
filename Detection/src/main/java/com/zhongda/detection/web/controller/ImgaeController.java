package com.zhongda.detection.web.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.zhongda.detection.web.model.Image;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.Result;
import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.service.ImageService;
import com.zhongda.detection.web.service.ProjectService;
import com.zhongda.detection.web.service.SysDictionaryService;

@RestController
@RequestMapping(value = "/image")
public class ImgaeController {
	
	@Resource
	private ImageService imageService;
	
	@Resource
	private SysDictionaryService sysDictionaryServce;
	
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
	public Result uploadSingleImage(@RequestParam(value = "file") MultipartFile file, Integer imageId){	
		Result result = imageService.uploadSingleImage(file, imageId);
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
	public Result uploadMultipleImage(@RequestParam(value = "file") MultipartFile file, Integer imageId){
		Result result = imageService.uploadMultipleImage(file, imageId);
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
	 * 加载添加弹出层的检测指标选项(所有项目公用所有检测指标)
	 * @param projectTypeId
	 * @return
	 */
	@RequestMapping(value = "/showDetectionStatus_addImage", method = RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showDetectionStatus_addImage(String projectName){
		return sysDictionaryServce.selectAllDetectionType();
	}

	/**
	 * 添加图片记录
	 * @param projectTypeId
	 * @return
	 */
	@RequestMapping(value = "/showAddImage", method = RequestMethod.POST)
	@ResponseBody
	public Image showAddImage(Integer projectId,Integer detectionTypeId){
		Project project = projectService.selectByPrimaryKey(projectId);
		Image image = new Image(project.getUserId(), project.getProjectId(), project.getProjectTypeId(), detectionTypeId,null,null,sysDictionaryServce.selectByPrimaryKey(detectionTypeId).getItemName());
		imageService.insertSelective(image);
		return image;
	}
//==>校验
	/**
	 * 校验该检测指标下是否已经存在图片
	 * @param projectTypeId
	 * @return
	 */
	@RequestMapping(value = "/OnlyImage", method = RequestMethod.POST)
	@ResponseBody
	public void OnlyImage(Integer selectDetectionTypeAddImage,Integer projectId_addImage, HttpServletResponse response){
		//response.setCharacterEncoding("UTF-8");
		Image image = imageService.selectImageByTwoId(projectId_addImage, selectDetectionTypeAddImage);
		try {
			if (image == null) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
