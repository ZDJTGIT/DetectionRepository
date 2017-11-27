package com.zhongda.detection.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.zhongda.detection.web.model.TerminalsInfo;
import com.zhongda.detection.web.service.TerminalsInfoService;

@Controller
@RequestMapping(value = "/terminals")
public class TerminalsController {

	@Autowired
	private TerminalsInfoService terminalsInfoService;
	
	/**
	 * 展示项目下所有采集器
	 * @param projectTypeId
	 * @return
	 */
	@RequestMapping(value = "/showProjectTerminals", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showProjectTerminals(Integer projectId,HttpServletRequest request) {
		//根据查询条件分页查询传感器
		List<TerminalsInfo> terminalsInfoList = terminalsInfoService.selectByProjectId(projectId);
		PageInfo<TerminalsInfo> TerminalsInfoPageInfo = new PageInfo<TerminalsInfo>(terminalsInfoList);
		Map<String, Object> TerminalsInfoMap = new HashMap<String, Object>();
		TerminalsInfoMap.put("total", TerminalsInfoPageInfo.getTotal());
		TerminalsInfoMap.put("terminalsInfoList", terminalsInfoList);
		//通过项目ID查询到所有传感器
		return TerminalsInfoMap;
	}
	
}
