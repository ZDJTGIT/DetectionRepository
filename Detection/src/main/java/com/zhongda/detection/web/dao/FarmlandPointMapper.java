package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.FarmlandPoint;

public interface FarmlandPointMapper {
    int deleteByPrimaryKey(Integer farmlandPointId);

    int insert(FarmlandPoint record);

    int insertSelective(FarmlandPoint record);

    FarmlandPoint selectByPrimaryKey(Integer farmlandPointId);

    int updateByPrimaryKeySelective(FarmlandPoint record);

    int updateByPrimaryKey(FarmlandPoint record);
}