package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.SysDictionary;

public interface SysDictionaryMapper {
    int deleteByPrimaryKey(Integer dicId);

    int insert(SysDictionary record);

    int insertSelective(SysDictionary record);

    SysDictionary selectByPrimaryKey(Integer dicId);

    int updateByPrimaryKeySelective(SysDictionary record);

    int updateByPrimaryKey(SysDictionary record);
}