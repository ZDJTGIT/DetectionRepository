package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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

}
