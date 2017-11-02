package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.SensorInfoMapper;
import com.zhongda.detection.web.model.SensorInfo;
import com.zhongda.detection.web.service.SensorInfoService;

@Service
public class SensorInfoServiceImpl implements SensorInfoService {
	
	@Resource
	private SensorInfoMapper sensorInfoMapper;

	@Override
	public int deleteByPrimaryKey(Integer sensorInfoId) {
		return sensorInfoMapper.deleteByPrimaryKey(sensorInfoId);
	}

	@Override
	public int deleteByProjectId(Integer project) {
		return sensorInfoMapper.deleteByProjectId(project);
	}

	@Override
	public List<SensorInfo> selectByDetectionPointId(Integer detectionPointId) {
		return sensorInfoMapper.selectByDetectionPointId(detectionPointId);
	}

	@Override
	public int deleteByDetectionPointId(Integer detectionPointId) {
		return sensorInfoMapper.deleteByDetectionPointId(detectionPointId);
	}

	@Override
	public int insertSelective(SensorInfo record) {
		return sensorInfoMapper.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(SensorInfo record) {
		return sensorInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public SensorInfo selectBySensorIdAndSensorType(Integer sensorId,
			String sensorType) {
		return sensorInfoMapper.selectBySensorIdAndSensorType(sensorId, sensorType);
	}

}
