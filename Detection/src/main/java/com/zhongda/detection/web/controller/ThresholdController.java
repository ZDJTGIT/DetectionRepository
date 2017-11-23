package com.zhongda.detection.web.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.WebUtils;

import com.zhongda.detection.web.model.OperationLog;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.model.Threshold;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.OperationLogService;
import com.zhongda.detection.web.service.ProjectService;
import com.zhongda.detection.web.service.SysDictionaryService;
import com.zhongda.detection.web.service.ThresholdService;

@RestController
@RequestMapping(value = "/threshold")
public class ThresholdController {

	@Autowired
	private ThresholdService thresholdService;

	@Resource
	private SysDictionaryService sysDictionaryServce;

	@Autowired
	private ProjectService projectService;
	
	@Resource
	private OperationLogService operationLogService;

	/**
	 * 修改阀值
	 * @param threshold
	 * @return
	 */
	@RequestMapping(value = "/updetaThreshold", method = RequestMethod.POST)
	@ResponseBody
	public Threshold updetaThreshold(@RequestBody Threshold threshold,HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 查询修改后的的阀值记录是否已存在
			Threshold selectedThreshold = thresholdService
					.selectThresholdByProjectIdDetectionTypeIdThresholdTypeId(
							threshold.getProjectId(),
							threshold.getDetectionTypeId(),
							threshold.getThresholdTypeId());
			if (selectedThreshold == null
					|| selectedThreshold.getThresholdId() == threshold
							.getThresholdId()) {
				Project project = projectService.selectByPrimaryKey(threshold
						.getProjectId());
				threshold.setUserId(project.getUserId());
				threshold.setProjectTypeId(project.getProjectTypeId());
				thresholdService.updateByPrimaryKeySelective(threshold);
				return threshold;
			} else {
				threshold.setThresholdId(0);
				//插入一条操作日志
				User currentUser = (User) WebUtils.getSessionAttribute(request,"userInfo");
				operationLogService.insertOperationLog(new OperationLog(currentUser.getUserId(),currentUser.getUserName(),"阀值修改",
						currentUser.getUserName()+"修改阀值,ID为："+threshold.getThresholdId(),new Date()));
				return threshold;
			}
		} else {
			return null;
		}
	}

	
	/**
	 * 查项目ID下所有阀值
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/showProjectThreshold", method = RequestMethod.POST)
	@ResponseBody
	public List<Threshold> showProjectThreshold(Integer projectId) {
		return thresholdService.selectByProjectId(projectId);
	}

	/**
	 * 显示当前项目下所有测点类型
	 * @param projectTypeId
	 * @return
	 */
	@RequestMapping(value = "/showDetectionType", method = RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showDetectionType(Integer projectTypeId) {
		return sysDictionaryServce.selectAllDetectionType();
	}

	/**
	 * 显示所有阀值类型（所有的测点类型都是公用同样的阀值类型）
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/showThresHoldType", method = RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showThresHoldType(Integer projectId) {
		// 所有阀值类型一致，通用
		return sysDictionaryServce.selectSysDictionaryByTypeCode(10);
	}

	/**
	 * 插入一条阀值(校验唯一性)
	 * @param threshold
	 * @return
	 */
	@RequestMapping(value = "/addThresHold", method = RequestMethod.POST)
	@ResponseBody
	public Threshold addThresHold(@RequestBody Threshold threshold,HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
		//查询新添加的阀值记录是否已存在
		Threshold selectedThreshold = thresholdService
				.selectThresholdByProjectIdDetectionTypeIdThresholdTypeId(
						threshold.getProjectId(),
						threshold.getDetectionTypeId(),
						threshold.getThresholdTypeId());
		if(selectedThreshold==null){
			Project project = projectService.selectByPrimaryKey(threshold
					.getProjectId());
			threshold.setUserId(project.getUserId());
			threshold.setProjectTypeId(project.getProjectTypeId());
			thresholdService.insertSelective(threshold);
			return threshold;
		}else{
			threshold.setThresholdId(0);
			//插入一条操作日志
			User currentUser = (User) WebUtils.getSessionAttribute(request,"userInfo");
			operationLogService.insertOperationLog(new OperationLog(currentUser.getUserId(),currentUser.getUserName(),"阀值插入",
					currentUser.getUserName()+"插入阀值,ID为："+threshold.getThresholdId(),new Date()));
			return threshold;
		}
		}else{
			return null;
		}
	}
}
