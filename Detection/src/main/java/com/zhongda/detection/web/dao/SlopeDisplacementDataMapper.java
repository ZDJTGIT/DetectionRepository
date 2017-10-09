package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.SlopeDisplacementData;

public interface SlopeDisplacementDataMapper {
    int deleteByPrimaryKey(Integer slopeDisplacementId);

    int insert(SlopeDisplacementData record);

    int insertSelective(SlopeDisplacementData record);

    SlopeDisplacementData selectByPrimaryKey(Integer slopeDisplacementId);

    int updateByPrimaryKeySelective(SlopeDisplacementData record);

    int updateByPrimaryKey(SlopeDisplacementData record);
}