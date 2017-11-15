package com.zhongda.detection.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.zhongda.detection.web.model.Alarm;
import com.zhongda.detection.web.model.AlarmLinkman;
import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.service.AlarmLinkmanService;
import com.zhongda.detection.web.service.AlarmService;

/**
 * <p>
 * 告警视图控制器
 * </p>
 * 
 * @author zmdeng
 * @date 2017年10月30日
 */
@Controller
@RequestMapping(value = "/alarm")
public class AlarmController {

	public static final Logger logger = LoggerFactory
			.getLogger(AlarmController.class);

	@Resource
	private AlarmService alarmService;

	@Resource
	private AlarmLinkmanService alarmLinkmanService;

	@RequestMapping("/alarmList")
	public String messageList() {
		// 进入告警列表页
		return "alarmList";
	}

	@RequestMapping("/alarmPageList")
	@ResponseBody
	public Map<String, Object> alarmPageList(@RequestBody Alarm alarm,
			HttpServletRequest request) {
		// 查出当前用户下所有未读的消息
		User user = (User) WebUtils.getSessionAttribute(request, "userInfo");
		alarm.setUserId(user.getUserId());
		List<Alarm> alarmList = alarmService
				.selectPageAlarmByUserIdAndOtherInfo(alarm);
		PageInfo<Alarm> alarmPageInfo = new PageInfo<Alarm>(alarmList);
		Map<String, Object> alarmMap = new HashMap<String, Object>();
		alarmMap.put("total", alarmPageInfo.getTotal());
		alarmMap.put("alarmList", alarmList);
		return alarmMap;
	}

	@RequestMapping(value = "/selectalarm_linkman")
	public String selectalarm_linkman(Model model) {
		List<AlarmLinkman> aLinkmanList = alarmLinkmanService.selectAll();
		model.addAttribute("aLinkmanList", aLinkmanList);
		return "alarm_linkman";
	}
	
	/**
	 * 展示项目下所有测点
	 */
	@RequestMapping(value = "/showProjectAlarm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showProjectAlarm(@RequestBody Project project,HttpServletRequest request){
		//根据查询条件分页查询告警信息
		List<Alarm> AlarmList = alarmService.selectAlarmWithAlarmCount(project);
		PageInfo<Alarm> AlarmPageInfo = new PageInfo<Alarm>(AlarmList);
		Map<String, Object> AlarmMap = new HashMap<String, Object>();
		AlarmMap.put("total", AlarmPageInfo.getTotal());
		AlarmMap.put("AlarmList", AlarmList);
		//通过项目ID查询到所有告警信息
		return AlarmMap;
	}
	
	/**
	 * 展示项目下所有测点
	 *//*
	@RequestMapping(value = "/showProjectAlarm", method = RequestMethod.POST)
	@ResponseBody
	public List<Alarm> showProjectAlarm(Integer projectId){
		return alarmService.selectAlarmByProjectId(projectId);
	}*/
}
