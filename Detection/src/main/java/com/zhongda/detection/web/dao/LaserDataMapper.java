package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.LaserData;

public interface LaserDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LaserData record);

    int insertSelective(LaserData record);

    LaserData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LaserData record);

    int updateByPrimaryKey(LaserData record);
}