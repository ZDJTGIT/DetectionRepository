package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.CrackerData;

public interface CrackerDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CrackerData record);

    int insertSelective(CrackerData record);

    CrackerData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CrackerData record);

    int updateByPrimaryKey(CrackerData record);
}