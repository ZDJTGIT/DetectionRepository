package com.zhongda.detection.web.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.model.StatisticChart;
import com.zhongda.detection.web.service.DetectionPointService;
import com.zhongda.detection.web.service.StatisticChartService;

@Controller
@RequestMapping(value = "/statistiCchart")
public class StatisticChartController {

	@Resource
	private StatisticChartService statisticChartService;

	@Resource
	private DetectionPointService detectionPointService;

	@RequestMapping(value = "/statistiCcharts")
	public String statistiCcharts(Integer projectId, Model model) {
		model.addAttribute("projectId", projectId);
		System.out.println("-----statistiCcharts-------" + projectId);
		return "graph_echarts_statistic_chart";
	}

	@RequestMapping(value = "/dataAnalysis", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dataAnalysis(Integer projectId,
			String begin, String end, String dateRange, String clickType,
			Model model) {
		System.out.println("-----------clickType:" + clickType);
		List<StatisticChart> detectionTypeList = statisticChartService
				.selectAllDataByProjectId(projectId);
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		Calendar lastDate = Calendar.getInstance();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("detectionList", detectionTypeList);
		if ("select".equals(clickType)) {
			System.out.println("select");
			end = simpleDateFormat.format(date);
			lastDate.setTime(date);
			if ("最近一周".equals(dateRange)) {
				lastDate.add(Calendar.DATE, -7);
			} else if ("最近一月".equals(dateRange)) {
				lastDate.add(Calendar.MONTH, -1);
			} else if ("最近三个月".equals(dateRange)) {
				lastDate.add(Calendar.MONTH, -3);
			} else if ("最近六个月".equals(dateRange)) {
				lastDate.add(Calendar.MONTH, -6);
			} else if ("最近一年".equals(dateRange)) {
				lastDate.add(Calendar.YEAR, -1);
			} else if ("全部".equals(dateRange)) {
				for (StatisticChart statisticChart : detectionTypeList) {
					List<DetectionPoint> selectDataByTabelName = detectionPointService
							.selectAllDataByTabelName(
									statisticChart.getTableName(), projectId,
									statisticChart.getDetectionTypeId());
					String[] split = statisticChart.getAttributes().split(",");
					hashMap.put(statisticChart.getDetectionTypeName(),
							selectDataByTabelName);
					hashMap.put(statisticChart.getDetectionTypeName() + "1",
							split);
				}
				return hashMap;
			}
			Date m = lastDate.getTime();
			begin = simpleDateFormat.format(m);
		} else {
			System.out.println("button");
			if (begin.length() == 0 || end.length() == 0) {
				end = simpleDateFormat.format(date);
				lastDate.setTime(date);
				lastDate.add(Calendar.DATE, -7);
				begin = simpleDateFormat.format(lastDate.getTime());
				System.out.println(begin + "******" + end);
			}
		}
		for (StatisticChart statisticChart : detectionTypeList) {
			List<DetectionPoint> selectDataByTabelName = detectionPointService
					.selectDataByTabelName(statisticChart.getTableName(),
							statisticChart.getProjectId(),
							statisticChart.getDetectionTypeId(), begin, end);
			String[] split = statisticChart.getAttributes().split(",");
			hashMap.put(statisticChart.getDetectionTypeName(),
					selectDataByTabelName);
			hashMap.put(statisticChart.getDetectionTypeName() + "1", split);
			System.out.println(statisticChart.getDetectionTypeName() + ":"
					+ selectDataByTabelName);
		}

		return hashMap;
	}
}
