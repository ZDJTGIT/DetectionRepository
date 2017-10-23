package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.PullData;

public interface PullDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PullData record);

    int insertSelective(PullData record);

    PullData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PullData record);

    int updateByPrimaryKey(PullData record);
}