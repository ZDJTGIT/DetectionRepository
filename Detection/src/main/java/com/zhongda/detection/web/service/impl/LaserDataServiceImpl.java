package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.LaserDataMapper;
import com.zhongda.detection.web.model.LaserData;
import com.zhongda.detection.web.service.LaserDataService;

@Service
public class LaserDataServiceImpl implements LaserDataService {

	@Resource
	private LaserDataMapper laserDataMapper;

	@Override
	public List<LaserData> selectAllDataBySensorIdAndTime(String sensorId,
			String currentTime) {
		return laserDataMapper.selectAllDataBySensorIdAndTime(sensorId,
				currentTime);
	}

}
