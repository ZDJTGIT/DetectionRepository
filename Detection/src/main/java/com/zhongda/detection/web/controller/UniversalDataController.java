package com.zhongda.detection.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.model.Image;
import com.zhongda.detection.web.model.StatisticChart;
import com.zhongda.detection.web.model.Threshold;
import com.zhongda.detection.web.service.DetectionPointService;
import com.zhongda.detection.web.service.ImageService;
import com.zhongda.detection.web.service.StatisticChartService;
import com.zhongda.detection.web.service.ThresholdService;

/**
 * 
 * <p>
 * </p>
 * 
 * @author 研发中心-LiIverson<1061734892@qq.com>
 * @sine 2017年12月1日
 */
@Controller
@RequestMapping(value = "/detectionType")
public class UniversalDataController {

	@Resource
	private StatisticChartService statisticChartService;

	@Resource
	private DetectionPointService detectionPointService;

	@Resource
	private ImageService imageService;

	@Resource
	private ThresholdService thresholdService;

	@RequestMapping(value = "/monitor")
	public String monitor(Integer projectId, Integer detectionTypeId,
			Model model) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String today = simpleDateFormat.format(new Date());
		Image image = imageService.selectImageByTwoId(projectId,
				detectionTypeId);
		model.addAttribute("today", today);
		model.addAttribute("image", image);
		model.addAttribute("projectId", projectId);
		model.addAttribute("detectionTypeId", detectionTypeId);
		return "graph_echarts_detectionType";
	}

	@RequestMapping(value = "/monitorData")
	public @ResponseBody Map<String, Object> monitorData(Integer projectId,
			Integer detectionTypeId, String currentTime) {
		System.out.println("projectId:" + projectId + " detectionTypeId:"
				+ detectionTypeId + " currentTime:" + currentTime);
		StatisticChart statisticChart = statisticChartService
				.selectDataByProjectIdAndDetectionTId(projectId,
						detectionTypeId);
		List<Threshold> thresholds = thresholdService.selectAndSysDByPIAndDTI(
				projectId, detectionTypeId);
		System.out.println(thresholds);
		String[] attributes = statisticChart.getAttributes().split(",");
		System.out.println(statisticChart);
		List<DetectionPoint> dataList = detectionPointService
				.selectDataByTNAndPIAndDTI(statisticChart.getTableName(),
						projectId, detectionTypeId, currentTime);
		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("attributes", attributes);
		hashMap.put("data", dataList);
		hashMap.put("tableName", statisticChart.getTableName());
		hashMap.put("thresholds", thresholds);
		return hashMap;
	}
}
