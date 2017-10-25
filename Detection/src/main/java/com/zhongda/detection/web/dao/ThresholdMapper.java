package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.Threshold;

public interface ThresholdMapper {
    int deleteByPrimaryKey(Integer thresholdId);

    int insert(Threshold record);

    /**
     * insert a Threshold
     * @param record
     * @return
     */
    int insertSelective(Threshold record);

    Threshold selectByPrimaryKey(Integer thresholdId);

    int updateByPrimaryKeySelective(Threshold record);

    int updateByPrimaryKey(Threshold record);
}