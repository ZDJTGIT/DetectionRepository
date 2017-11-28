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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.zhongda.detection.web.model.OperationLog;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.Result;
import com.zhongda.detection.web.model.Terminals;
import com.zhongda.detection.web.model.TerminalsInfo;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.OperationLogService;
import com.zhongda.detection.web.service.TerminalsInfoService;
import com.zhongda.detection.web.service.TerminalsService;

@Controller
@RequestMapping(value = "/terminals")
public class TerminalsController {

	@Autowired
	private TerminalsService terminalsService;
	
	@Autowired
	private TerminalsInfoService terminalsInfoService;
	
	@Resource
	private OperationLogService operationLogService;


	/**
	 * 添加采集器
	 * @param Terminals
	 * @return
	 */
	@RequestMapping(value = "/addTerminals", method = RequestMethod.POST)
	@ResponseBody
	public Result addTerminals(@RequestBody TerminalsInfo terminalsInfo,HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		Result result = new Result();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			Terminals terminals =terminalsService.selectBySmuId(terminalsInfo.getSmuId());
			terminalsInfoService.insertSelective(terminalsInfo);
			if(null == terminals){
				terminals =new Terminals();
				terminals.setSmuId(terminalsInfo.getSmuId());
			}
			result.setCode(Result.SUCCESS);
			result.setData(terminals);
			result.setMsg("插入采集器成功");
			// 插入一条操作日志
			User currentUser = (User) WebUtils.getSessionAttribute(request,"userInfo");
			operationLogService.insertOperationLog(new OperationLog(currentUser.getUserId(), currentUser.getUserName(), "采集器插入",
						currentUser.getUserName() + "在项目ID为："+terminalsInfo.getProjectId()+"下插入采集器，采集器编号为："+ terminalsInfo.getSmuId(), new Date()));
			return result;
		} else {
			result.setCode(Result.FAILURE);
			return result;
		}
	}
	
	/**
	 * 展示项目下所有采集器
	 * @param projectTypeId
	 * @return
	 */
	@RequestMapping(value = "/showProjectTerminals", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showProjectTerminals(@RequestBody  Project project,HttpServletRequest request) {
		//根据查询条件分页查询传感器
		List<Terminals> terminalsInfoList = terminalsService.selectByProjectId(project);
		PageInfo<Terminals> TerminalsPageInfo = new PageInfo<Terminals>(terminalsInfoList);
		Map<String, Object> TerminalsMap = new HashMap<String, Object>();
		TerminalsMap.put("total", TerminalsPageInfo.getTotal());
		TerminalsMap.put("terminalsInfoList", terminalsInfoList);
		//通过项目ID查询到所有传感器
		return TerminalsMap;
	}
	
	/**
	 * 删除选中的采集器
	 * @param detectionPointId
	 * @return
	 */
	@RequestMapping(value = "/deleteTerminalsInfo", method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteTerminalsInfo(String smuId,Integer projectId, HttpServletRequest request){
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 管理员用户，可删除采集器
			terminalsInfoService.deleteBySmuIdAndProjectId(smuId, projectId);
			// 插入一条操作日志
			User currentUser = (User) WebUtils.getSessionAttribute(request,"userInfo");
			operationLogService.insertOperationLog(new OperationLog(currentUser.getUserId(), currentUser.getUserName(), "采集器删除",
					currentUser.getUserName() + "在项目ID为："+projectId+"下插入传感器，传感器编号为："+ smuId, new Date()));
			return 1;
		} else {
			// 非管理员不能删除测点
			return 2;
		}
	}

//==>校验
	
	/**
	 * 验证同一个项目下采集器名是否唯一(添加验证)
	 * @param DetectionName_addDetection
	 * @param ProjectName_addDetection
	 * @param response
	 */
	@RequestMapping(value = "/OnlyTerminals", method = RequestMethod.POST)
	public void OnlyTerminals(String terminalsNum, Integer terminals_projectId, HttpServletResponse response) {
		TerminalsInfo terminalsInfo = terminalsInfoService.selectBySmuIdAndProjectId(terminalsNum, terminals_projectId);
		try {
			if (terminalsInfo == null) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
