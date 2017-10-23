package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.SensorInfo;

public interface SensorInfoMapper {
    int deleteByPrimaryKey(Integer sensorInfoId);

    int insert(SensorInfo record);

    int insertSelective(SensorInfo record);

    SensorInfo selectByPrimaryKey(Integer sensorInfoId);

    int updateByPrimaryKeySelective(SensorInfo record);

    int updateByPrimaryKey(SensorInfo record);
}