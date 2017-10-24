package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.SensorData;

public interface SensorDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SensorData record);

    int insertSelective(SensorData record);

    SensorData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SensorData record);

    int updateByPrimaryKey(SensorData record);
}