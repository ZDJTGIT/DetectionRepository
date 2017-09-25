package com.zhongda.detection.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.common.collect.Multimap;
import com.zhongda.detection.web.model.FarmlandPH;
import com.zhongda.detection.web.service.FarmlandPHService;

/**
 *<p>农田PH</p>
 * @author zmdeng
 * @date 2017年9月25日
 */
@Controller
@RequestMapping("/farmland")
public class FarmlandPHController {

	@Resource
	private FarmlandPHService farmlandPHService;

	@RequestMapping("project/{projectId}")
	public String sensorType(Model model, @PathVariable("projectId") Integer projectId) {
		Multimap<Integer, FarmlandPH> multimap = farmlandPHService.selectFarmlandPHByProjectIdAndToday(projectId);
		model.addAttribute("farmlandPHMap", multimap);
		return "graph_echarts_farmland";
	}
}
