package com.zhongda.detection.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.service.SysDictionaryService;

/**
 *<p>系统字典视图控制器</p>
 * @author zmdeng
 * @date 2017年10月31日
 */
@Controller
@RequestMapping(value = "/sysDictionary")
public class SysDictionaryController {

	public static final Logger logger = LoggerFactory
			.getLogger(SysDictionaryController.class);

	@Resource
	private SysDictionaryService sysDictionaryService;
	
	@RequestMapping("/alarmTypeAndStatus")
	@ResponseBody
	public List<SysDictionary> queryAlarmTypeAndStatus(String alarmType, String alarmStatus) {
		//查出所有的告警类型和告警状态的项
		List<SysDictionary> sysDictionaryList = sysDictionaryService.selectSysDictionaryByAlarmTypeAndStatus(alarmType, alarmStatus);
		return sysDictionaryList;
	}
	
	@RequestMapping("/queryType")
	@ResponseBody
	public List<SysDictionary> queryType(Integer typeCode) {
		//查出所有的检测指标
		List<SysDictionary> sysDictionaryList = sysDictionaryService.selectSysDictionaryByTypeCode(typeCode);
		return sysDictionaryList;
	}
	
	/**
	 * 查询所有数据展示类型
	 * 
	 */
	@RequestMapping("/queryStatistic")
	@ResponseBody
	public List<String> queryStatisticChart( Integer typeCode ){
		
		List<SysDictionary> sysDictionaryList = sysDictionaryService.selectSysDictionaryByTypeCode(typeCode);
		SysDictionary statistic  = sysDictionaryList.get(0);
		String statisticChart = statistic.getItemName();
		String [] statisticChartArr = statisticChart.split(",");
		List <String > list_statistic = new ArrayList<String>();
		
		for(int i = 0 ; i<statisticChartArr.length ;i++){
			list_statistic.add(statisticChartArr[i]);
		}
		System.out.println(list_statistic);
		return list_statistic;
	}
	
}
