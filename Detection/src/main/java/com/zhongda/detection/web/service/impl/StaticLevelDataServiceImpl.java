package com.zhongda.detection.web.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.core.utils.MapParam;
import com.zhongda.detection.web.dao.StaticLevelDataMapper;
import com.zhongda.detection.web.model.StaticLevelData;
import com.zhongda.detection.web.model.UniversalData;
import com.zhongda.detection.web.service.StaticLevelDataService;

@Service
public class StaticLevelDataServiceImpl implements StaticLevelDataService {

	@Resource
	private StaticLevelDataMapper staticLevelDataMapper;

	@Override
	public List<StaticLevelData> selectAllDataBySensorIdAndTime(
			String sensorId, String currentTime) {
		return staticLevelDataMapper.selectAllDataBySensorIdAndTime(sensorId,
				currentTime);
	}

	@Override
	public List<UniversalData> selectUniversalDataBySensorIdAndTimeAndTN(
			String tableName, String sensorId, String smuCmsId,
			String smuCmsChannel, String currentTime) {
		return staticLevelDataMapper.selectUniversalDataBySensorIdAndTimeAndTN(
				tableName, sensorId, smuCmsId, smuCmsChannel, currentTime);
	}

	@Override
	public List<UniversalData> selectUniversalDataBySTT(String tableName,
			String sensorId, String currentTime) {
		return staticLevelDataMapper.selectUniversalDataBySTT(tableName,
				sensorId, currentTime);
	}

	// @Override
	// public Map<Object, Object> selectOneDayLastData(String tableName,
	// Integer projectId, String beginTime, String endTime,
	// MapParam mapParam) {
	// return staticLevelDataMapper.selectOneDayLastData(tableName, projectId,
	// beginTime, endTime, mapParam);
	// }

}
