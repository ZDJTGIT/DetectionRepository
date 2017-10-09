package com.zhongda.detection.web.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Multimap;
import com.zhongda.detection.web.model.FarmlandPH;
import com.zhongda.detection.web.service.FarmlandPHService;

/**
 *<p>农田PH</p>
 * @author zmdeng
 * @date 2017年9月25日
 */
@Controller
@RequestMapping("/farmlandph")
public class FarmlandPHController {

	public static final Logger logger = LoggerFactory.getLogger(FarmlandPHController.class);

	@Resource
	private FarmlandPHService farmlandPHService;

	@RequestMapping("project/{projectId}")
	public String sensorType(Model model, @PathVariable("projectId") Integer projectId){
		Multimap<Integer, FarmlandPH> multimap = farmlandPHService.selectFarmlandPHByProjectIdAndToday(projectId);
		ObjectMapper mapper = new ObjectMapper();
		String phJson = null;
		try {
			phJson = mapper.writeValueAsString(multimap.asMap());
		} catch (JsonProcessingException e) {
			logger.error(e.getMessage());
		}
		model.addAttribute("phJson", phJson);
		return "graph_echarts_farmland";
	}
}
