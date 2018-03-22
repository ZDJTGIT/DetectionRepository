package com.zhongda.detection.web.controller;

import java.text.ParseException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.model.Image;
import com.zhongda.detection.web.model.StatisticChart;
import com.zhongda.detection.web.model.Threshold;
import com.zhongda.detection.web.service.DetectionPointService;
import com.zhongda.detection.web.service.ImageService;
import com.zhongda.detection.web.service.StaticLevelDataService;
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

	@Resource
	private StaticLevelDataService staticLevelDataService;

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
			Integer detectionTypeId, String currentTime) throws ParseException {
		System.out.println("projectId:" + projectId + " detectionTypeId:"
				+ detectionTypeId + " currentTime:" + currentTime);
		StatisticChart statisticChart = statisticChartService
				.selectDataByProjectIdAndDetectionTId(projectId,
						detectionTypeId);
		// String sensorId = statisticChart.getSensorId();
		List<Threshold> thresholds = thresholdService.selectAndSysDByPIAndDTI(
				projectId, detectionTypeId);
		System.out.println(thresholds);
		String[] attributes = statisticChart.getAttributes().split(",");
		System.out.println(statisticChart);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = format.parse(currentTime);
		String beginTime = currentTime;
		String endTime = null;
		Calendar calendar = Calendar.getInstance();
		/* 收敛只显示0点到凌晨6点的数据 begin */
		if (detectionTypeId == 26) {
			beginTime = currentTime + " 00:00:00";
			endTime = currentTime + " 05:05:00";
		}
		/* 收敛只显示0点到凌晨6点的数据 end */
		else {
			calendar.setTime(date);
			calendar.add(Calendar.DATE, +1);
			endTime = format.format(calendar.getTime());
		}
		System.out.println("unBUGbegintime:" + beginTime + "  unBUGendtime:"
				+ endTime);
		List<DetectionPoint> dataList = detectionPointService
				.selectDataByTNAndPIAndDTI(statisticChart.getTableName(),
						projectId, detectionTypeId, beginTime, endTime);
		Map<String, Object> hashMap = new HashMap<String, Object>();
		// System.out.println(dataList);
		// DecimalFormat decimalFormat = new DecimalFormat("#.0000");
		// System.out.println(sensorId + "--------------------");
		// if (null != sensorId) {
		// List<UniversalData> sensorIdDatas = staticLevelDataService
		// .selectUniversalDataBySTT(statisticChart.getTableName(),
		// sensorId, currentTime);
		// for (DetectionPoint detectionPoint : dataList) {
		// if (!(detectionPoint.getDetectionName().equals("CJ" + sensorId))) {
		// for (int i = 0; i < detectionPoint.getUniversalDataList()
		// .size(); i++) {
		// detectionPoint
		// .getUniversalDataList()
		// .get(i)
		// .setCurrentLaserChange(
		// Double.valueOf(decimalFormat
		// .format(detectionPoint
		// .getUniversalDataList()
		// .get(i)
		// .getCurrentLaserChange()
		// - sensorIdDatas
		// .get(i)
		// .getCurrentLaserChange())));
		// detectionPoint
		// .getUniversalDataList()
		// .get(i)
		// .setTotalLaserChange(
		// Double.valueOf(decimalFormat
		// .format(detectionPoint
		// .getUniversalDataList()
		// .get(i)
		// .getTotalLaserChange()
		// - sensorIdDatas
		// .get(i)
		// .getTotalLaserChange())));
		// detectionPoint
		// .getUniversalDataList()
		// .get(i)
		// .setSpeedChange(
		// Double.valueOf(decimalFormat
		// .format(detectionPoint
		// .getUniversalDataList()
		// .get(i)
		// .getSpeedChange()
		// - sensorIdDatas
		// .get(i)
		// .getSpeedChange())));
		// detectionPoint
		// .getUniversalDataList()
		// .get(i)
		// .setCurrentData(
		// Double.valueOf(decimalFormat
		// .format(detectionPoint
		// .getUniversalDataList()
		// .get(i)
		// .getCurrentData()
		// - sensorIdDatas
		// .get(i)
		// .getCurrentData())));
		// }
		// }
		//
		// }
		//
		// }
		hashMap.put("attributes", attributes);
		hashMap.put("data", dataList);
		hashMap.put("tableName", statisticChart.getTableName());
		hashMap.put("thresholds", thresholds);
		return hashMap;
	}
}
