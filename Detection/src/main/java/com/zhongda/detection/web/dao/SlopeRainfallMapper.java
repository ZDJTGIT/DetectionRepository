package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.SlopeRainfall;

public interface SlopeRainfallMapper {
    int deleteByPrimaryKey(Integer rainfallId);

    int insert(SlopeRainfall record);

    int insertSelective(SlopeRainfall record);

    SlopeRainfall selectByPrimaryKey(Integer rainfallId);

    int updateByPrimaryKeySelective(SlopeRainfall record);

    int updateByPrimaryKey(SlopeRainfall record);
}