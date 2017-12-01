package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.Threshold;

/**
 * <p>
 * Threshold业务 接口
 * </p>
 * 
 * @author mike
 * @date 2017年10月24日
 */
public interface ThresholdService {

	/**
	 * insert a Threshold
	 * 
	 * @param record
	 * @return
	 */
	int insertSelective(Threshold record);

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

	/**
	 * 根据项目ID查所有Threshold表记录
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

	/**
	 * 根据项目ID和测点类型ID精确查找到预警表中的一条记录
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	List<Threshold> selectByProjectIdAndDetectionTypeId(Integer projectId,
			Integer detectionTypeId);

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

	/**
	 * 根据项目ID和测点类型ID关联字典表精确查找到阈值表中的一条记录
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	List<Threshold> selectAndSysDByPIAndDTI(Integer projectId,
			Integer detectionTypeId);

}
