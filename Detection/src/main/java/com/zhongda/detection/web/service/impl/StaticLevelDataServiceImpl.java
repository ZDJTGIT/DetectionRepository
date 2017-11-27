package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.StaticLevelDataMapper;
import com.zhongda.detection.web.model.StaticLevelData;
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

}
