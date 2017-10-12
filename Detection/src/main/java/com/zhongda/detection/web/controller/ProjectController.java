package com.zhongda.detection.web.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
		return projectService.selectProjectAndSysDicByUserId(userId);
	}

	@RequestMapping(value = "/queryItem")
	public @ResponseBody Map<String, List<SensorInfo>> queryItem(
			Integer projectId) {
		return sensorInfoService.selectsenInfoAndSysdicByProjectId(projectId);
	}

	@RequestMapping(value = "/displacement")
	public String displacement(Model model, Integer projectId,
			Integer detectionTypeId) throws JsonProcessingException {
		System.out.println("-------displacement---Controller--------------"
				+ projectId + "---" + detectionTypeId);
		List<SensorInfo> sensorInfoList = sensorInfoService
				.selectInfoAndDisplacementData(projectId, detectionTypeId);
		// 对数据进行结构处理begin
		Map<String, Map<Float, SensorInfo>> sensorMap = new HashMap<String, Map<Float, SensorInfo>>();
		HashSet<Float> depthSet = new HashSet<Float>();
		for (SensorInfo sensorInfo : sensorInfoList) {
			String key = "测点" + sensorInfo.getDetectionId();
			Map<Float, SensorInfo> value = sensorMap.get(key);
			if (null == value) {
				value = new HashMap<Float, SensorInfo>();
			}
			value.put(sensorInfo.getSensorDepth(), sensorInfo);
			sensorMap.put(key, value);
			depthSet.add(sensorInfo.getSensorDepth());
		}
		List<Float> arrayList = new ArrayList<Float>(depthSet);
		Collections.sort(arrayList);
		// 对数据进行结构处理begin
		System.out.println("---------------------end");
		// 转JSON格式
		ObjectMapper mapper = new ObjectMapper();
		String sensorJson = mapper.writeValueAsString(sensorMap);
		String depth = mapper.writeValueAsString(arrayList);
		model.addAttribute("sensorJson", sensorJson);
		model.addAttribute("depth", depth);
		System.out.println("------------------" + sensorJson);
		return "graph_echarts_displacement";
	}

}
