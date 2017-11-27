package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.SysDictionary;

/**
 *<p>字典表 接口</p>
 * @author mike
 * @date 2017年10月18日
 */
public interface SysDictionaryService {
	
    /**
     * 通过项目类型ID查字典表
     * @param dicId
     * @return
     */
    SysDictionary selectByPrimaryKey(Integer dicId);

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
	
	/**
	 * 通过type_value的值来获取系统字典对象
	 * @param alarmType type_value对应的值
	 * @param alarmStatus type_value对应的值
	 * @return
	 */
	List<SysDictionary> selectSysDictionaryByAlarmTypeAndStatus(
			String alarmType, String alarmStatus);

	/**
	 * 根据typecode查字典表所有字段
	 * @param typeCode
	 * @return
	 */
	List<SysDictionary> selectSysDictionaryByTypeCode(Integer typeCode);	

}
