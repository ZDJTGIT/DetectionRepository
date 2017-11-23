package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.OperationLog;

/**
 * <p> 操作日志 业务 接口</p>
 * @author zmdeng
 * @date 2017年11月23日
 */
public interface OperationLogService {
	
	/**
	 * 插入一条操作日志
	 * @param operationLog 日志记录
	 */
	void insertOperationLog(OperationLog operationLog);
	
	/**
	 * 分页查询操作日志记录
	 * @param operationLog 封装查询条件
	 * @return
	 */
	List<OperationLog> selectPageOperationLog(OperationLog operationLog);
}