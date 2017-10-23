package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.SteelBarsData;

public interface SteelBarsDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SteelBarsData record);

    int insertSelective(SteelBarsData record);

    SteelBarsData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SteelBarsData record);

    int updateByPrimaryKey(SteelBarsData record);
}