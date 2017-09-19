package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.FarmlandThreshold;

public interface FarmlandThresholdMapper {
    int deleteByPrimaryKey(Integer farmlandThresholdId);

    int insert(FarmlandThreshold record);

    int insertSelective(FarmlandThreshold record);

    FarmlandThreshold selectByPrimaryKey(Integer farmlandThresholdId);

    int updateByPrimaryKeySelective(FarmlandThreshold record);

    int updateByPrimaryKey(FarmlandThreshold record);
}