package com.zhongda.detection.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhongda.detection.web.model.Threshold;

public interface ThresholdMapper {
	/**
	 * 根据告警信息ID删除告警信息
	 * 
	 * @param thresholdId
	 * @return
	 */
	int deleteByPrimaryKey(Integer thresholdId);

	/**
	 * 根据项目ID删除告警信息（删除项目下所有告警信息）
	 * 
	 * @param projectId
	 * @return
	 */
	int deleteByProjectId(Integer projectId);

	int insert(Threshold record);

	/**
	 * 插入一条预值
	 * 
	 * @param record
	 * @return
	 */
	int insertSelective(Threshold record);

	Threshold selectByPrimaryKey(Integer thresholdId);

	/**
	 * 根据项目ID查所有Threshold表记录(包括虚拟字段-测点类型名)
	 * 
	 * @param projectId
	 * @return
	 */
	List<Threshold> selectByProjectId(Integer projectId);

	/**
	 * 根据预值ID修改记录
	 * 
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(Threshold record);

	int updateByPrimaryKey(Threshold record);

	/**
	 * 根据项目ID和测点类型ID精确查找到预警表中的一条记录
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	Threshold selectByProjectIdAndDetectionTypeId(Integer projectId,
			Integer detectionTypeId);

	/**
	 * 查询指定项目阈值
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	List<Threshold> selectThresholdByTwoId(
			@Param(value = "projectId") Integer projectId,
			@Param(value = "detectionTypeId") Integer detectionTypeId);

	/**
	 * 做校验用-通过项目ID，测点类型ID，阀值类型ID查询唯一的阀值记录
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @param thresholdTypeId
	 * @return
	 */
	Threshold selectThresholdByProjectIdDetectionTypeIdThresholdTypeId(
			Integer projectId, Integer detectionTypeId, Integer thresholdTypeId);
}