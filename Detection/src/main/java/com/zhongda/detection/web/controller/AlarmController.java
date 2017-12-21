package com.zhongda.detection.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.zhongda.detection.web.model.Alarm;
import com.zhongda.detection.web.model.AlarmLinkman;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.Result;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.RoleSign;
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
	
	/**
	 * 点击所有告警消息
	 * @return
	 */
	@RequestMapping("/alarmList")
	public String alarmList() {
		// 进入告警列表页
		return "alarmList";
	}
	
	/**
	 * 点击单个告警消息
	 * @param alarmId 告警消息id
	 * @param model
	 * @return
	 */
	@RequestMapping("/alarmList/{alarmId}")
	public String alarmSingle(@PathVariable("alarmId") String alarmId, Model model) {
		model.addAttribute("alarmId", alarmId);
		return "alarmList";
	}
	
	/**
	 * 点击单个项目下所有告警消息
	 * @param projectId 项目id
	 * @param model
	 * @return
	 */
	@RequestMapping("/alarmList/project/{projectId}")
	public String alarmOfProject(@PathVariable("projectId") String projectId, Model model) {
		model.addAttribute("projectId", projectId);
		return "alarmList";
	}

	@RequestMapping("/alarmPageList")
	@ResponseBody
	public Map<String, Object> alarmPageList(@RequestBody Alarm alarm,
			HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (!subject.hasRole(RoleSign.ADMIN)
				&& !subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 非管理员用户，只可查看自己的告警信息，查询条件增加userId
			User user = (User) WebUtils.getSessionAttribute(request, "userInfo");
			alarm.setUserId(user.getUserId());
		}
		List<Alarm> alarmList = alarmService.selectPageAlarmByQuery(alarm);
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
	 * 展示项目下所有告警信息
	 */
	@RequestMapping(value = "/showProjectAlarm", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showProjectAlarm(@RequestBody Project project){
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
	 * 修改告警消息状态为确认状态
	 * @param alarmId
	 * @return
	 */
	@RequestMapping("/alarmConfirm")
	@ResponseBody
	public Result<Alarm> alarmConfirm(Integer alarmId) {
		Result<Alarm> result = alarmService.updateAlarmStatus(alarmId);
		return result;
	}
	
	/**
	 * 批量修改告警消息状态为确认状态
	 * @param alarmId
	 * @return
	 */
	@RequestMapping("/alarmBatchConfirm")
	@ResponseBody
	public Result<Alarm> alarmBatchConfirm(String alarmIds) {
		Result<Alarm> result = alarmService.updateBatchAlarmStatus(alarmIds);
		return result;
	}
	
	/**
	 * 批量修改通过查询条件查询出来的告警消息状态为确认状态
	 * @param alarm 封装的查询条件
	 * @param request
	 * @return
	 */
	@RequestMapping("/alarmBatchConfirmByQuery")
	@ResponseBody
	public Result<Alarm> alarmBatchConfirmByQuery(@RequestBody Alarm alarm, HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (!subject.hasRole(RoleSign.ADMIN)
				&& !subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 非管理员用户，只可查看自己的告警信息，查询条件增加userId
			User user = (User) WebUtils.getSessionAttribute(request, "userInfo");
			alarm.setUserId(user.getUserId());
		}		
		Result<Alarm> result = alarmService.updateBatchAlarmStatusByQuery(alarm);
		return result;
	}
}
