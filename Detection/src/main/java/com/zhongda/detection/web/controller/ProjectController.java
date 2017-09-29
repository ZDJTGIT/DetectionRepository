package com.zhongda.detection.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.SensorInfo;
import com.zhongda.detection.web.service.ProjectService;
import com.zhongda.detection.web.service.SensorInfoService;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	@Autowired
	private SensorInfoService sensorInfoService;

	@RequestMapping(value = "/myproject")
	public @ResponseBody Map<String, List<Project>> queryProject(Integer userId) {
		System.out.println("-------userID:" + userId);
		return projectService.selectProjectAndSysDicByUserId(userId);
	}

	@RequestMapping(value = "/queryItem")
	public @ResponseBody Map<String, List<SensorInfo>> queryItem(
			Integer projectId) {
		System.out.println("----------------projectID:" + projectId);
		return sensorInfoService.selectsenInfoAndSysdicByProjectId(projectId);
	}

}
