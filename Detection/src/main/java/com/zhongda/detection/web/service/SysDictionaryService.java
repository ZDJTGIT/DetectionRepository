package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.SysDictionary;

/**
 *<p>字典表 接口</p>
 * @author mike
 * @date 2017年10月18日
 */
public interface SysDictionaryService {
	
	int deleteByPrimaryKey(Integer dicId);

    int insert(SysDictionary record);

    int insertSelective(SysDictionary record);

    /**
     * 通过项目类型ID查字典表
     * @param dicId
     * @return
     */
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
