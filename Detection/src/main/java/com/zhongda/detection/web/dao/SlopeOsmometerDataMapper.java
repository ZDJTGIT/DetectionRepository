package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.SlopeOsmometerData;

public interface SlopeOsmometerDataMapper {
    int deleteByPrimaryKey(Integer slopeOsmometerId);

    int insert(SlopeOsmometerData record);

    int insertSelective(SlopeOsmometerData record);

    SlopeOsmometerData selectByPrimaryKey(Integer slopeOsmometerId);

    int updateByPrimaryKeySelective(SlopeOsmometerData record);

    int updateByPrimaryKey(SlopeOsmometerData record);
}