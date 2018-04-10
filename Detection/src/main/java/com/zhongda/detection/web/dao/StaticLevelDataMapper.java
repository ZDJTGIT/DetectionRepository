package com.zhongda.detection.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.zhongda.detection.core.utils.MapParam;
import com.zhongda.detection.web.model.StaticLevelData;
import com.zhongda.detection.web.model.UniversalData;

public interface StaticLevelDataMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(StaticLevelData record);

	int insertSelective(StaticLevelData record);

	StaticLevelData selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(StaticLevelData record);

	int updateByPrimaryKey(StaticLevelData record);

	/**
	 * 通过传感器ID和时间查询数据
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @return
	 */
	List<StaticLevelData> selectAllDataBySensorIdAndTime(
			@Param(value = "sensorId") String sensorId,
			@Param(value = "currentTime") String currentTime);

	/**
	 * 通过传感器ID,表名和时间查询数据
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @return
	 */
	List<UniversalData> selectUniversalDataBySensorIdAndTimeAndTN(
			String tableName, @Param(value = "sensorId") String sensorId,
			@Param(value = "smuCmsId") String smuCmsId,
			@Param(value = "smuCmsChannel") String smuCmsChannel,
			@Param(value = "currentTime") String currentTime);

	/**
	 * 通过传感器ID,表名和时间查询数据并按照时间排序
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @return
	 */
	List<UniversalData> selectUniversalDataBySTT(String tableName,
			@Param(value = "sensorId") String sensorId,
			@Param(value = "currentTime") String currentTime);

	/**
	 * 查询传感器最后第一天最后一条数据
	 * 
	 * @param tableName
	 * @param snesorId
	 * @param beginTime
	 * @param endTime
	 * @return
	 */
	Map<Object, Object> selectOneDayLastData(String tableName,
			Integer projectId, String beginTime, String endTime,
			MapParam mapParam);
}