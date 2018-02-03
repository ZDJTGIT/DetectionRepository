package com.zhongda.detection.web.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.zhongda.detection.web.model.OperationLog;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.SensorInfo;
import com.zhongda.detection.web.model.SensorInfoError;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.OperationLogService;
import com.zhongda.detection.web.service.SensorInfoService;

@Controller
@RequestMapping(value = "/sensorInfo")
public class SensorInfoController {

	@Resource
	private SensorInfoService sensorInfoService;
	
	@Resource
	private OperationLogService operationLogService;

	/**
	 * 展示项目下所有传感器
	 * @param project
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/showProjectSensorInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showProjectSensorInfo(@RequestBody Project project,HttpServletRequest request) {
		//根据查询条件分页查询测点
		List<SensorInfo> sensorInfoList = sensorInfoService.selectSensorInfoWithAlarmCount(project);
		PageInfo<SensorInfo> sensorInfoListPageInfo = new PageInfo<SensorInfo>(sensorInfoList);
		Map<String, Object> sensorInfoMap = new HashMap<String, Object>();
		sensorInfoMap.put("total", sensorInfoListPageInfo.getTotal());
		sensorInfoMap.put("sensorInfoList", sensorInfoList);
		//通过项目ID查询到所有测点
		return sensorInfoMap;
	}
	
//	/**
//	 * 展示项目下所有传感器
//	 * @param projectId
//	 * @return
//	 */
//	@RequestMapping(value = "/showProjectSensorInfo", method = RequestMethod.POST)
//	@ResponseBody
//	public List<SensorInfo> showProjectSensorInfo(Integer projectId) {
//		return sensorInfoService.selectByProjectId(projectId);
//	}
	
	/**
	 * 展示测点下所有传感器
	 * @param detectionPointId
	 * @return
	 */
	@RequestMapping(value = "/showDetectionPointSensorInfo", method = RequestMethod.POST)
	@ResponseBody
	public List<SensorInfo> showDetectionPointSensorInfo(
			Integer detectionPointId) {
		return sensorInfoService.selectByDetectionPointId(detectionPointId);
	}

	/**
	 * 添加一个传感器
	 * 刚刚添加时sensorInfoId为空不能修改和删除传感器---
	 * @param sensorInfo
	 * @return
	 */
	@RequestMapping(value = "/addSensorInfo", method = RequestMethod.POST)
	@ResponseBody
	public SensorInfo addSensorInfo(@RequestBody SensorInfo sensorInfo,HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			String smu_id =sensorInfo.getSmuId();
			String smu_cms_channel=sensorInfo.getSmuCmsChannel();
			String sensorId_addSensorInfo=sensorInfo.getSensorId();
			SensorInfo sensorInfo_condition= sensorInfoService.selectVirtualPk(smu_id,smu_cms_channel,sensorId_addSensorInfo);
			if(sensorInfo_condition!=null){
				return new SensorInfoError("测点数据已存在,"+"传感器 I  D:"+sensorId_addSensorInfo+",采集器编号:"+smu_id+",采集器通道:"+smu_cms_channel);
			}
		sensorInfoService.insertSelective(sensorInfo);
		//把数据库的自增长编号取出
		//sensorInfo = sensorInfoService.selectBySensorIdAndSensorType(sensorInfo.getSensorId(), null);
		//插入一条操作日志
		User currentUser = (User) WebUtils.getSessionAttribute(request,"userInfo");
		operationLogService.insertOperationLog(new OperationLog(currentUser.getUserId(),currentUser.getUserName(),"传感器插入",
				currentUser.getUserName()+"在ID为："+sensorInfo.getDetectionPointId()+"的测点下插入传感器，编号为："+sensorInfo.getSensorId(),new Date()));
		return sensorInfo;
		}else{
			return null;
		}
	}

	/**
	 * 删除一个传感器
	 * @param sensorInfoId
	 * @return
	 */
	@RequestMapping(value = "/deleteSensorInfo", method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteSensorInfo(Integer sensorInfoId,HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 管理员用户，可删除传感器
			sensorInfoService.deleteByPrimaryKey(sensorInfoId);
			//插入一条操作日志
			User currentUser = (User) WebUtils.getSessionAttribute(request,"userInfo");
			operationLogService.insertOperationLog(new OperationLog(currentUser.getUserId(),currentUser.getUserName(),"传感器删除",
					currentUser.getUserName()+"删除传感器,ID为："+sensorInfoId,new Date()));
			return 1;
		} else {
			// 非管理员不能删除项目
			return 2;
		}
	}

	/**
	 * 修改传感器信息
	 * @param sensorInfo
	 * @return
	 */
	@RequestMapping(value = "/updetaSensorInfo", method = RequestMethod.POST)
	@ResponseBody
	public SensorInfo updetaSensorInfo(@RequestBody SensorInfo sensorInfo,HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			String smu_id =sensorInfo.getSmuId();
			String smu_cms_channel=sensorInfo.getSmuCmsChannel();
			String sensorId_addSensorInfo=sensorInfo.getSensorId();
			SensorInfo sensorInfo_condition= sensorInfoService.selectVirtualPk(smu_id,smu_cms_channel,sensorId_addSensorInfo);
			if(sensorInfo_condition!=null){
				return new SensorInfoError("测点数据已存在,"+"传感器 I  D:"+sensorId_addSensorInfo+",采集器编号:"+smu_id+",采集器通道:"+smu_cms_channel);
			}
			// 管理员用户，可以修改传感器信息
			sensorInfoService.updateByPrimaryKeySelective(sensorInfo);
			//插入一条操作日志
			User currentUser = (User) WebUtils.getSessionAttribute(request,"userInfo");
			operationLogService.insertOperationLog(new OperationLog(currentUser.getUserId(),currentUser.getUserName(),"传感器修改",
					currentUser.getUserName()+"修改传感器,ID为："+sensorInfo.getSensorInfoId(),new Date()));
			return sensorInfo;
		} else {
			// 非管理员不能修改传感器信息
			return null;
		}
	}
	
//校验==>
	
	/**
	 * 验证传感器ID是否唯一(添加验证)
	 * @param sensorId_addSensorInfo
	 * @param sensorType_addSensorInfo
	 * @param response
	 */
	@RequestMapping(value = "/OnlysensorInfoId", method = RequestMethod.POST)
	public void OnlyProjectName(String sensorId_addSensorInfo,String terminalsInfoNum_addSensorInfo,Integer projectId_addSensorInfo,HttpServletResponse response) {
		
		String[] datas = terminalsInfoNum_addSensorInfo.split(":");
		String smu_id = "";
		String smu_cms_channel ="";
		if(datas.length==2){
			 smu_id = datas[0];//对应页面采集器编号
			 smu_cms_channel = datas[1];//采集器通道:
		}else{
			try {
				response.getWriter().print(true);
				return ;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		SensorInfo sensorInfo = sensorInfoService.selectVirtualPk(smu_id,smu_cms_channel,sensorId_addSensorInfo);//sensorId_addSensorInfo传感器 I  D:
		/*SensorInfo sensorInfo = sensorInfoService.selectBySensorIdAndSensorType(smu_id,smu_cms_channel,sensorId_addSensorInfo);*/
		try {
			if (sensorInfo == null) {
				response.getWriter().print(true);
				return ;
			} else {
				response.getWriter().print(false);
				return ;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 验证传感器ID是否唯一(修改验证)
	 * @param sensorId_updetaSensorInfo
	 * @param sensorType_updetaSensorInfo
	 * @param response
	 */
	@RequestMapping(value = "/upOnlysensorInfoId", method = RequestMethod.POST)
	public void upOnlyProjectName(String sensorId_updetaSensorInfo, String sensorType_updetaSensorInfo,
			Integer sensorInfoId_updetaSensorInfo,Integer projectId_updetaSensorInfo, HttpServletResponse response) {
		SensorInfo sensorInfoLL = sensorInfoService.selectSensorInfoBySensorInfoId(sensorInfoId_updetaSensorInfo);
		if(sensorInfoLL.getSensorId().equals(sensorId_updetaSensorInfo)){
			try {
				response.getWriter().print(true);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
		SensorInfo sensorInfo = sensorInfoService.selectBySensorIdAndSensorType(sensorId_updetaSensorInfo, projectId_updetaSensorInfo);
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

}
