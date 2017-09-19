package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.Equipment;

public interface EquipmentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Equipment record);

    int insertSelective(Equipment record);
}