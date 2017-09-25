package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.SensorInfoMapper;
import com.zhongda.detection.web.model.SensorInfo;
import com.zhongda.detection.web.service.SensorInfoService;

/**
 *<p>传感器 业务 实现类</p>
 * @author zmdeng
 * @date 2017年9月25日
 */
@Service
public class SensorInfoServiceImpl implements SensorInfoService{

	@Resource
	private SensorInfoMapper sensorInfoMapper;

	@Override
	public List<SensorInfo> selectSensorTypeByProjectId(Integer projectId) {
		return sensorInfoMapper.selectSensorTypeByProjectId(projectId);
	}

}
