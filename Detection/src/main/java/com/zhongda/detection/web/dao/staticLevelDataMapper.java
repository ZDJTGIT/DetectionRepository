package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.staticLevelData;

public interface staticLevelDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(staticLevelData record);

    int insertSelective(staticLevelData record);

    staticLevelData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(staticLevelData record);

    int updateByPrimaryKey(staticLevelData record);
}