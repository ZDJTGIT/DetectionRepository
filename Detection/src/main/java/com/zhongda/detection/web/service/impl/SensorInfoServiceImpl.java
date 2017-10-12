package com.zhongda.detection.web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.SensorInfoMapper;
import com.zhongda.detection.web.model.SensorInfo;
import com.zhongda.detection.web.service.SensorInfoService;

/**
 * <p>
 * 传感器 业务 实现类
 * </p>
 * 
 * @author zmdeng
 * @date 2017年9月25日
 */
@Service
public class SensorInfoServiceImpl implements SensorInfoService {

	@Resource
	private SensorInfoMapper sensorInfoMapper;

	@Override
	public List<SensorInfo> selectSensorTypeByProjectId(Integer projectId) {
		return sensorInfoMapper.selectSensorTypeByProjectId(projectId);
	}

	@Override
	public Map<String, List<SensorInfo>> selectsenInfoAndSysdicByProjectId(
			Integer projectId) {
		List<SensorInfo> sensorInfoList = sensorInfoMapper
				.selectsenInfoAndSysdicByProjectId(projectId);
		// 对查找出来的数据进行数据结构处理key = itemname value = SensorInfo对象
		Map<String, List<SensorInfo>> sensorMap = new HashMap<String, List<SensorInfo>>();
		for (SensorInfo sensorInfo : sensorInfoList) {
			String key = sensorInfo.getSysDictionary().getItemName();
			List<SensorInfo> value = sensorMap.get(key);
			if (null == value) {
				value = new ArrayList<SensorInfo>();
			}
			value.add(sensorInfo);
			sensorMap.put(key, value);
		}
		return sensorMap;
	}

	@Override
	public List<SensorInfo> selectInfoAndDisplacementData(Integer projectId,
			Integer detectionTypeId) {
		return sensorInfoMapper.selectInfoAndDisplacementData(projectId,
				detectionTypeId);
	}
}
