package com.zhongda.detection.web.service;

import java.util.List;
import java.util.Map;

import com.zhongda.detection.core.utils.MapParam;
import com.zhongda.detection.web.model.StaticLevelData;
import com.zhongda.detection.web.model.UniversalData;

public interface StaticLevelDataService {

	/**
	 * 通过传感器ID和时间查询数据
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @return
	 */
	List<StaticLevelData> selectAllDataBySensorIdAndTime(String sensorId,
			String currentTime);

	/**
	 * 通过传感器ID,表名和时间查询数据
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @return
	 */
	List<UniversalData> selectUniversalDataBySensorIdAndTimeAndTN(
			String tableName, String sensorId, String smuCmsId,
			String smuCmsChannel, String currentTime);

	/**
	 * 通过传感器ID,表名和时间查询数据并按照时间排序
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @return
	 */
	List<UniversalData> selectUniversalDataBySTT(String tableName,
			String sensorId, String currentTime);

	/*	*//**
	 * 查询传感器最后第一天最后一条数据
	 * 
	 * @param tableName
	 * @param snesorId
	 * @param beginTime
	 * @param endTime
	 * @return
	 */
	/*
	 * Map<Object, Object> selectOneDayLastData(String tableName, Integer
	 * projectId, String beginTime, String endTime, MapParam mapParam);
	 */

}
