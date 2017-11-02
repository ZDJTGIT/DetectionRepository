package com.zhongda.detection.web.controller;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.model.Threshold;
import com.zhongda.detection.web.service.ProjectService;
import com.zhongda.detection.web.service.SysDictionaryService;
import com.zhongda.detection.web.service.ThresholdService;

@RestController
@RequestMapping(value = "/threshold")
public class ThresholdController {

	@Autowired
	private ThresholdService thresholdService;

	@Resource
	private SysDictionaryService sysDictionaryServce;

	@Autowired
	private ProjectService projectService;

	/**
	 * 查项目ID下所有阀值
	 */
	@RequestMapping(value = "/showProjectThreshold", method = RequestMethod.POST)
	@ResponseBody
	public List<Threshold> showProjectThreshold(Integer projectId) {
		return thresholdService.selectByProjectId(projectId);
	}

	/**
	 * 显示当前项目下所有测点类型
	 */
	@RequestMapping(value = "/showDetectionType", method = RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showDetectionType(Integer projectTypeId) {
		return sysDictionaryServce
				.selectSysDictionaryByProjectTypeId(projectTypeId);
	}

	/**
	 * 显示所有阀值类型（所有的测点类型都是公用同样的阀值类型）
	 */
	@RequestMapping(value = "/showThresHoldType", method = RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showThresHoldType(Integer projectId) {
		// 所有阀值类型一致，通用
		return sysDictionaryServce.selectSysDictionaryByTypeCode(10);
	}

	/**
	 * 插入一条阀值(校验唯一性)
	 */
	@RequestMapping(value = "/addThresHold", method = RequestMethod.POST)
	@ResponseBody
	public Threshold addThresHold(@RequestBody Threshold threshold) {
		//查询新添加的阀值记录是否已存在
		Threshold selectedThreshold = thresholdService
				.selectThresholdByProjectIdDetectionTypeIdThresholdTypeId(
						threshold.getProjectId(),
						threshold.getDetectionTypeId(),
						threshold.getThresholdTypeId());
		if(selectedThreshold==null){
			Project project = projectService.selectByPrimaryKey(threshold
					.getProjectId());
			threshold.setUserId(project.getUserId());
			threshold.setProjectTypeId(project.getProjectTypeId());
			thresholdService.insertSelective(threshold);
			return threshold;
		}else{
			return null;
		}
	}
}
