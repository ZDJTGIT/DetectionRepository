package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.LaserData;

public interface LaserDataService {
	/**
	 * 通过传感器ID和时间查询数据
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @return
	 */
	List<LaserData> selectAllDataBySensorIdAndTime(String sensorId,
			String currentTime);
}
