package com.zhongda.detection.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.zhongda.detection.web.model.OperationLog;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.OperationLogService;

@Controller
@RequestMapping(value = "/operationlog")
public class OperationLogContorller {

	@Resource
	private OperationLogService operationLogService;

	@RequestMapping(value = "/selectlog", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> selectlog(String aoData,
			HttpServletRequest request) throws JsonParseException,
			JsonMappingException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		@SuppressWarnings("unchecked")
		Map<String, Object> readValue = objectMapper.readValue(aoData,
				Map.class);
		Integer sEcho = (Integer) readValue.get("sEcho");
		Integer iDisplayStart = (Integer) readValue.get("iDisplayStart");
		Integer iDisplayLength = (Integer) readValue.get("iDisplayLength");
		String condition = (String) readValue.get("sSearch");
		Integer pageNum = (iDisplayStart + iDisplayLength) / iDisplayLength;
		List<OperationLog> selectlogByUserId = null;
		User user = (User) WebUtils.getSessionAttribute(request, "userInfo");
		Subject subject = SecurityUtils.getSubject();
		Integer userId = user.getUserId();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			if (condition.length() > 0) {
				selectlogByUserId = operationLogService
						.selectLogByBlurryqueryByAdmin(pageNum, iDisplayLength,
								condition);
			} else {
				selectlogByUserId = operationLogService
						.selectAlllogByUserIdByAdmin(pageNum, iDisplayLength);
			}
		} else {
			if (condition.length() > 0) {
				selectlogByUserId = operationLogService.selectLogByBlurryquery(
						pageNum, iDisplayLength, condition, userId);
			} else {
				selectlogByUserId = operationLogService.selectAlllogByUserId(
						pageNum, iDisplayLength, userId);
			}
		}

		PageInfo<OperationLog> pageInfo = new PageInfo<OperationLog>(
				selectlogByUserId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sEcho", sEcho);
		map.put("iTotalRecords", pageInfo.getTotal());
		map.put("iTotalDisplayRecords", pageInfo.getTotal());
		map.put("aaData", selectlogByUserId);
		return map;
	}
}
