package com.zhongda.detection.web.controller;

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
}
