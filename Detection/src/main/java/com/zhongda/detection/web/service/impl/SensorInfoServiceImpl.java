package com.zhongda.detection.web.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.SensorInfoMapper;
import com.zhongda.detection.web.model.SensorInfo;
import com.zhongda.detection.web.model.SlopeDisplacementData;
import com.zhongda.detection.web.model.SlopeRainfall;
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
	public int selectCountByProjectAndDetectionId(Integer projectId,
			Integer detectionTypeId) {
		return sensorInfoMapper.selectCountByProjectAndDetectionId(projectId,
				detectionTypeId);
	}

	@Override
	public Map<String, Object> selectInfoAndDisplacementData(
			String currentTimes, Integer projectId, Integer detectionTypeId) {
		List<SensorInfo> sensorList = sensorInfoMapper
				.selectInfoAndDisplacementData(currentTimes, projectId,
						detectionTypeId);
		Map<String, Object> map = new HashMap<String, Object>();
		List<Integer> detectionNumsList = new ArrayList<Integer>();
		List<String> timeList = new ArrayList<String>();
		SimpleDateFormat format = new SimpleDateFormat();
		format.applyPattern("yyyy-MM-dd HH:mm:ss");
		if (sensorList.size() != 0) {
			for (SlopeDisplacementData slopeDisplacementData : sensorList
					.get(0).getSlopeDisplacementDataList()) {
				detectionNumsList.add(slopeDisplacementData.getDetectionNums());
				timeList.add(format.format(
						slopeDisplacementData.getCurrentTimes()).substring(10,
						19));
			}
		}
		Map<String, Map<Object, Map<Float, SlopeDisplacementData>>> detectionIdValue = new HashMap<String, Map<Object, Map<Float, SlopeDisplacementData>>>();
		HashSet<Float> depthSet = new HashSet<Float>();
		HashSet<String> detectionSet = new HashSet<String>();// 测点IDLIST
		for (SensorInfo sensor : sensorList) {
			// 根据次数分组
			String detectionIdKey = "测点" + sensor.getDetectionId();
			detectionSet.add(detectionIdKey);
			Map<Object, Map<Float, SlopeDisplacementData>> dValue = detectionIdValue
					.get(detectionIdKey);
			if (null == dValue) {
				dValue = new HashMap<Object, Map<Float, SlopeDisplacementData>>();
			}
			for (SlopeDisplacementData sData : sensor
					.getSlopeDisplacementDataList()) {
				// 根据次数
				Integer detectionNum = sData.getDetectionNums();
				Map<Float, SlopeDisplacementData> numValue = dValue
						.get(detectionNum);
				// 根据时间
				String timeString = format.format(sData.getCurrentTimes())
						.substring(10, 19);
				Map<Float, SlopeDisplacementData> timeValue = dValue
						.get(timeString);
				if (null == numValue) {
					numValue = new HashMap<Float, SlopeDisplacementData>();
					timeValue = new HashMap<Float, SlopeDisplacementData>();
				}
				if (null == timeValue) {
					timeValue = new HashMap<Float, SlopeDisplacementData>();
				}
				numValue.put(sensor.getSensorDepth(), sData);
				timeValue.put(sensor.getSensorDepth(), sData);
				dValue.put(detectionNum, numValue);
				dValue.put(timeString, timeValue);
				depthSet.add(sensor.getSensorDepth());

			}
			detectionIdValue.put(detectionIdKey, dValue);
		}
		ArrayList<Float> depthList = new ArrayList<Float>(depthSet);
		ArrayList<String> detectionList = new ArrayList<String>(detectionSet);
		Collections.sort(detectionNumsList);
		Collections.sort(timeList);
		Collections.sort(depthList);
		Collections.sort(detectionList);
		map.put("detectionNumsList", detectionNumsList);
		map.put("timeList", timeList);
		map.put("detectionIdValue", detectionIdValue);
		map.put("depthList", depthList);
		map.put("detectionList", detectionList);
		return map;
	}

	@Override
	public int selectCountAndRainfall(Integer projectId, Integer detectionTypeId) {
		return sensorInfoMapper.selectCountAndRainfall(projectId,
				detectionTypeId);
	}

	@Override
	public Map<String, Object> selectInfoAndSlopeRainfall(String detectionTime,
			Integer projectId, Integer detectionTypeId) {
		List<SensorInfo> sensorList = sensorInfoMapper
				.selectInfoAndSlopeRainfall(detectionTime, projectId,
						detectionTypeId);
		HashSet<String> detectionIdSet = new HashSet<String>();// 测点ID数组集合
		HashSet<String> timeSet = new HashSet<String>();// 测点ID数组集合
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Map<String, SlopeRainfall>> dataMap = new HashMap<String, Map<String, SlopeRainfall>>();

		SimpleDateFormat format = new SimpleDateFormat();
		format.applyPattern("yyyy-MM-dd HH:mm:ss");
		for (SensorInfo sensorInfo : sensorList) {
			String key = "测点" + sensorInfo.getDetectionId();
			detectionIdSet.add(key);// 把测点放入detectionIdSet集合
			Map<String, SlopeRainfall> slopeMap = dataMap.get(key);
			if (null == slopeMap) {
				slopeMap = new HashMap<String, SlopeRainfall>();
			}
			for (SlopeRainfall slopRainfall : sensorInfo.getSlopeRainfallList()) {
				String timeKey = format.format(slopRainfall.getDetectionTime())
						.substring(0, 10);
				slopeMap.put(timeKey, slopRainfall);
				timeSet.add(timeKey);
			}
			dataMap.put(key, slopeMap);
		}
		ArrayList<String> detectionIdList = new ArrayList<String>(
				detectionIdSet);
		ArrayList<String> timeList = new ArrayList<String>(timeSet);
		Collections.sort(detectionIdList);
		Collections.sort(timeList);
		map.put("detectionIdList", detectionIdList);
		map.put("timeList", timeList);
		map.put("dataMap", dataMap);
		return map;
	}
}
