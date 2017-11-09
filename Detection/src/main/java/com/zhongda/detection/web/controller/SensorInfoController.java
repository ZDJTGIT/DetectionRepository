package com.zhongda.detection.web.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.SensorInfo;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.SensorInfoService;

@Controller
@RequestMapping(value = "/sensorInfo")
public class SensorInfoController {

	@Resource
	private SensorInfoService sensorInfoService;

	/**
	 * 展示项目下所有传感器
	 */
	@RequestMapping(value = "/showProjectSensorInfo", method = RequestMethod.POST)
	@ResponseBody
	public List<SensorInfo> showProjectSensorInfo(
			Integer projectId) {
		return sensorInfoService.selectByProjectId(projectId);
	}
	
	/**
	 * 展示测点下所有传感器
	 */
	@RequestMapping(value = "/showDetectionPointSensorInfo", method = RequestMethod.POST)
	@ResponseBody
	public List<SensorInfo> showDetectionPointSensorInfo(
			Integer detectionPointId) {
		return sensorInfoService.selectByDetectionPointId(detectionPointId);
	}

	/**
	 * 添加一个传感器
	 */
	@RequestMapping(value = "/addSensorInfo", method = RequestMethod.POST)
	@ResponseBody
	public SensorInfo addSensorInfo(@RequestBody SensorInfo sensorInfo) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
		sensorInfoService.insertSelective(sensorInfo);
		return sensorInfo;
		}else{
			return null;
		}
	}

	/**
	 * 删除一个传感器
	 */
	@RequestMapping(value = "/deleteSensorInfo", method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteSensorInfo(Integer sensorInfoId) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 管理员用户，可删除传感器
			sensorInfoService.deleteByPrimaryKey(sensorInfoId);
			return 1;
		} else {
			// 非管理员不能删除项目
			return 2;
		}
	}

	/**
	 * 修改传感器信息
	 */
	@RequestMapping(value = "/updetaSensorInfo", method = RequestMethod.POST)
	@ResponseBody
	public SensorInfo updetaSensorInfo(@RequestBody SensorInfo sensorInfo) {
		System.out.println("adasdasdasdsaddas------------"
				+ sensorInfo.getSensorId());
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 管理员用户，可以修改传感器信息
			sensorInfoService.updateByPrimaryKeySelective(sensorInfo);
			return sensorInfo;
		} else {
			// 非管理员不能修改传感器信息
			return null;
		}
	}
	
//校验
	/**
	 * 验证传感器ID是否唯一(添加验证)
	 */
	@RequestMapping(value = "/OnlysensorInfoId", method = RequestMethod.POST)
	public void OnlyProjectName(Integer sensorId_addSensorInfo,String sensorType_addSensorInfo, HttpServletResponse response) {
		SensorInfo sensorInfo = sensorInfoService.selectBySensorIdAndSensorType(sensorId_addSensorInfo, sensorType_addSensorInfo);
		try {
			if (sensorInfo == null) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 验证传感器ID是否唯一(添加验证)
	 */
	@RequestMapping(value = "/upOnlysensorInfoId", method = RequestMethod.POST)
	public void upOnlyProjectName(Integer sensorId_updetaSensorInfo, String sensorType_updetaSensorInfo, HttpServletResponse response) {
		SensorInfo sensorInfo = sensorInfoService.selectBySensorIdAndSensorType(sensorId_updetaSensorInfo, sensorType_updetaSensorInfo);
		try {
			if (sensorInfo == null) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
