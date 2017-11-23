package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.zhongda.detection.web.dao.OperationLogMapper;
import com.zhongda.detection.web.model.OperationLog;
import com.zhongda.detection.web.service.OperationLogService;

@Service
public class OperationLogServiceImpl implements OperationLogService {

	@Resource
	private OperationLogMapper operationLogMapper;

	@Override
	public void insertOperationLog(OperationLog operationLog) {
		operationLogMapper.insertSelective(operationLog);
	}

	@Override
	public List<OperationLog> selectPageOperationLog(OperationLog operationLog) {
		return null;
	}

	@Override
	public List<OperationLog> selectLogByBlurryquery(Integer start,
			Integer length, String condition, Integer userId) {
		PageHelper.startPage(start, length);
		return operationLogMapper.selectLogByBlurryquery(condition, userId);
	}

	@Override
	public List<OperationLog> selectAlllogByUserId(Integer start,
			Integer length, Integer userId) {
		PageHelper.startPage(start, length);
		return operationLogMapper.selectAlllogByUserId(userId);
	}

	@Override
	public List<OperationLog> selectLogByBlurryqueryByAdmin(Integer start,
			Integer length, String condition) {
		PageHelper.startPage(start, length);
		return operationLogMapper.selectLogByBlurryqueryByAdmin(condition);
	}

	@Override
	public List<OperationLog> selectAlllogByUserIdByAdmin(Integer start,
			Integer length) {
		PageHelper.startPage(start, length);
		return operationLogMapper.selectAlllogByUserIdByAdmin();
	}

}
