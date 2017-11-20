package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.StaticLevelData;

public interface StaticLevelDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StaticLevelData record);

    int insertSelective(StaticLevelData record);

    StaticLevelData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StaticLevelData record);

    int updateByPrimaryKey(StaticLevelData record);
}