package com.zhongda.detection.web.service;

import java.util.List;

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
			String tableName, String sensorId, String currentTime);

	/**
	 * 通过传感器ID,表名和时间查询数据并按照时间排序
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @return
	 */
	List<UniversalData> selectUniversalDataBySTT(String tableName,
			String sensorId, String currentTime);

}
