package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.SensorInfo;

public interface SensorInfoMapper {
    int deleteByPrimaryKey(Integer sensorId);

    int insert(SensorInfo record);

    int insertSelective(SensorInfo record);

    SensorInfo selectByPrimaryKey(Integer sensorId);

    int updateByPrimaryKeySelective(SensorInfo record);

    int updateByPrimaryKey(SensorInfo record);

	/**
     * 通过项目id来查询对应的所有传感器信息
     * @param projectId
     * @return
     */
	List<SensorInfo> selectSensorTypeByProjectId(Integer projectId);
}