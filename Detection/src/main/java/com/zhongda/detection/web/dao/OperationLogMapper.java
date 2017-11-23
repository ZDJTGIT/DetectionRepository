package com.zhongda.detection.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhongda.detection.web.model.OperationLog;

public interface OperationLogMapper {
	int deleteByPrimaryKey(Integer logId);

	int insert(OperationLog record);

	int insertSelective(OperationLog record);

	OperationLog selectByPrimaryKey(Integer logId);

	int updateByPrimaryKeySelective(OperationLog record);

	int updateByPrimaryKey(OperationLog record);

	/**
	 * 模糊查询日志信息
	 * 
	 * @return
	 */
	List<OperationLog> selectLogByBlurryquery(
			@Param(value = "condition") String condition,
			@Param(value = "userId") Integer userId);

	/**
	 * 查询日志信息通过用户ID
	 * 
	 * @return
	 */
	List<OperationLog> selectAlllogByUserId(Integer userId);

	/**
	 * 模糊查询日志信息
	 * 
	 * @return
	 */
	List<OperationLog> selectLogByBlurryqueryByAdmin(String condition);

	/**
	 * 查询日志信息通过用户ID
	 * 
	 * @return
	 */
	List<OperationLog> selectAlllogByUserIdByAdmin();
}