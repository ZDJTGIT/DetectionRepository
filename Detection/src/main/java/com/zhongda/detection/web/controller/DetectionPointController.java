package com.zhongda.detection.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.DetectionPointService;
import com.zhongda.detection.web.service.ProjectService;
import com.zhongda.detection.web.service.SensorInfoService;
import com.zhongda.detection.web.service.SysDictionaryService;

@Controller
@RequestMapping(value = "/detectionPoint")
public class DetectionPointController {
	
	@Autowired
	private ProjectService projectService;
	
	@Resource
	private DetectionPointService detectionPointService;
	
	@Resource
	private SysDictionaryService sysDictionaryServce;
	
	@Autowired
	private SensorInfoService sensorInfoService;
	
	/**
	 * 展示项目下所有测点
	 */
	@RequestMapping(value = "/showProjectDetectionPoint", method = RequestMethod.POST)
	@ResponseBody
	public List<DetectionPoint> showProjectDetectionPoint(String projectName){
		//通过projectName查询项目ID，
		Project project = projectService.selectByProjectName(projectName);
		//通过项目ID查询到所有测点
		List<DetectionPoint> detectionPointList = detectionPointService.selectByProjectId(project.getProjectId());
		for(DetectionPoint detectionPoint:detectionPointList){
			detectionPoint.setItemName(sysDictionaryServce.selectProjectStatusByDicId((detectionPoint.getDetectionTypeId())));
		}
		return detectionPointList;
	}
	
	/**
	 * 修改测点
	 */
	@RequestMapping(value = "/updetaDetectionPoint", method = RequestMethod.POST)
	@ResponseBody
	public DetectionPoint updetaDetectionPoint(@RequestBody DetectionPoint detectionPoint){
		detectionPoint.setProjectId(projectService.selectByProjectName(detectionPoint.getProjectName()).getProjectId());
		detectionPointService.updateByPrimaryKeySelective(detectionPoint);
		return detectionPoint;
	}
	
	/**
	 * 修改时选中当前测点的测点类型
	 */
	@RequestMapping(value = "/showSelectDetectionType", method = RequestMethod.POST)
	@ResponseBody
	public SysDictionary showSelectDetectionType(Integer detectionTypeId){
		return sysDictionaryServce.selectByPrimaryKey(detectionTypeId);
	}
	
	/**
	 * 删除选中的测点（包括测点下的所有传感器）
	 * @param detectionPointId
	 * @return
	 */
	@RequestMapping(value = "/deleteDetectionPoint", method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteDetectionPoint(Integer detectionPointId){
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 管理员用户，可删除测点
			//测点ID删除测点
			detectionPointService.deleteByPrimaryKey(detectionPointId);
			//测点ID删除传感器
			sensorInfoService.deleteByDetectionPointId(detectionPointId);
			return 1;
		} else {
			// 非管理员不能删除测点
			return 2;
		}
	}
	
	/**
	 * 根据输入测点名查询所有符合模糊查询的测点展示
	 */
	@RequestMapping(value = "/keywordSearchDetectionPoint", method = RequestMethod.POST)
	@ResponseBody
	public SysDictionary keywordSearchDetectionPoint(Integer detectionTypeId){
		return sysDictionaryServce.selectByPrimaryKey(detectionTypeId);
	}

}
