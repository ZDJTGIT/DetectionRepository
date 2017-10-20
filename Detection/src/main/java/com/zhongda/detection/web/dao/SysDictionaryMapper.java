package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.SysDictionary;

public interface SysDictionaryMapper {
    int deleteByPrimaryKey(Integer dicId);

    int insert(SysDictionary record);

    int insertSelective(SysDictionary record);

    SysDictionary selectByPrimaryKey(Integer dicId);

    int updateByPrimaryKeySelective(SysDictionary record);

    int updateByPrimaryKey(SysDictionary record);
    
    /**
	 * 查所有项目类型
	 * 
	 */
	List<SysDictionary> selectSysDictionaryType();
}