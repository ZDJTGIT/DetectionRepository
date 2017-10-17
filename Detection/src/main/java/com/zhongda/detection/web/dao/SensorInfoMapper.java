package com.zhongda.detection.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhongda.detection.web.model.SensorInfo;

public interface SensorInfoMapper {
	int deleteByPrimaryKey(Integer sensorId);

	int insert(SensorInfo record);

	int insertSelective(SensorInfo record);

	SensorInfo selectByPrimaryKey(Integer sensorId);

	int updateByPrimaryKeySelective(SensorInfo record);

	int updateByPrimaryKey(SensorInfo record);

	/**
	 * 通过项目id来查询对应的所有传感器信息
	 * 
	 * @param projectId
	 * @return
	 */
	List<SensorInfo> selectSensorTypeByProjectId(Integer projectId);

	/**
	 * 查询传感器信息表和字典表通过项目ID
	 * 
	 * @param projectId
	 * @return
	 */
	List<SensorInfo> selectsenInfoAndSysdicByProjectId(Integer projectId);

	/**
	 * 查询当前深部位移项目有没有数据
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	int selectCountByProjectAndDetectionId(
			@Param("projectId") Integer projectId,
			@Param("detectionTypeId") Integer detectionTypeId);

	/**
	 * 查询传感器数据通过项目ID和字典编号
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	List<SensorInfo> selectInfoAndDisplacementData(
			@Param("currentTimes") String currentTimes,
			@Param("projectId") Integer projectId,
			@Param("detectionTypeId") Integer detectionTypeId);

	/**
	 * 查询当前雨量项目有没有数据
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	int selectCountAndRainfall(@Param("projectId") Integer projectId,
			@Param("detectionTypeId") Integer detectionTypeId);

	/**
	 * 查询边坡雨量通过项目ID和字典编号
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	List<SensorInfo> selectInfoAndSlopeRainfall(
			@Param("detectionTime") String detectionTime,
			@Param("projectId") Integer projectId,
			@Param("detectionTypeId") Integer detectionTypeId);
}