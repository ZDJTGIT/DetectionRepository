package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.SlopeOsmometer;

public interface SlopeOsmometerMapper {
    int deleteByPrimaryKey(Integer osmometerId);

    int insert(SlopeOsmometer record);

    int insertSelective(SlopeOsmometer record);

    SlopeOsmometer selectByPrimaryKey(Integer osmometerId);

    int updateByPrimaryKeySelective(SlopeOsmometer record);

    int updateByPrimaryKey(SlopeOsmometer record);
}