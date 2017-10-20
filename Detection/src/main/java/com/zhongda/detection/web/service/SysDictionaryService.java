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

    SysDictionary selectByPrimaryKey(Integer dicId);

    int updateByPrimaryKeySelective(SysDictionary record);

    int updateByPrimaryKey(SysDictionary record);
    
    /**
	 * 查所有项目类型
	 * 
	 */
	List<SysDictionary> selectSysDictionaryType();

}
