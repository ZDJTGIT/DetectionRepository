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
	
	/**
	 * 查所有项目状态
	 * 
	 */
	List<SysDictionary> selectSysDictionaryType_Status();
	
	/**
	 * 通过ID查询项目状态
	 * 
	 */
	String selectProjectStatusByDicId(Integer dicId);
	
	/**
	 * 通过项目类型ID查询该项目对应所有测点类型
	 * @param projectTypeId
	 * @return
	 */
	List<SysDictionary> selectSysDictionaryByProjectTypeId(Integer projectTypeId);
}