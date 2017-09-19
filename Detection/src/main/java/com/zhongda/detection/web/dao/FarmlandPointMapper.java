package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.FarmlandPoint;

public interface FarmlandPointMapper {
    int deleteByPrimaryKey(Integer timeId);

    int insert(FarmlandPoint record);

    int insertSelective(FarmlandPoint record);

    FarmlandPoint selectByPrimaryKey(Integer timeId);

    int updateByPrimaryKeySelective(FarmlandPoint record);

    int updateByPrimaryKey(FarmlandPoint record);
}