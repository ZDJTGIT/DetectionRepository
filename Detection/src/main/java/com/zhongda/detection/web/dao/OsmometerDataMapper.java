package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.OsmometerData;

public interface OsmometerDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OsmometerData record);

    int insertSelective(OsmometerData record);

    OsmometerData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OsmometerData record);

    int updateByPrimaryKey(OsmometerData record);
}