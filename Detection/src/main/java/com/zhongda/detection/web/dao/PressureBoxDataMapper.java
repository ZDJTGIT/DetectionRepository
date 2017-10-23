package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.PressureBoxData;

public interface PressureBoxDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PressureBoxData record);

    int insertSelective(PressureBoxData record);

    PressureBoxData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PressureBoxData record);

    int updateByPrimaryKey(PressureBoxData record);
}