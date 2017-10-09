package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.SlopeDisplacement;

public interface SlopeDisplacementMapper {
    int deleteByPrimaryKey(Integer displacementId);

    int insert(SlopeDisplacement record);

    int insertSelective(SlopeDisplacement record);

    SlopeDisplacement selectByPrimaryKey(Integer displacementId);

    int updateByPrimaryKeySelective(SlopeDisplacement record);

    int updateByPrimaryKey(SlopeDisplacement record);
}