package com.zhongda.detection.web.service.impl;


import java.util.List;

import javax.annotation.Resource;

import com.zhongda.detection.web.dao.SysDictionaryMapper;
import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.service.SysDictionaryService;

public class SysDictionaryServiceImpl implements SysDictionaryService {

	@Resource
	private SysDictionaryMapper sysDictionaryMapper;
	 
	@Override
	public int deleteByPrimaryKey(Integer dicId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(SysDictionary record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(SysDictionary record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public SysDictionary selectByPrimaryKey(Integer dicId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(SysDictionary record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(SysDictionary record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<SysDictionary> selectSysDictionaryType() {
		return sysDictionaryMapper.selectSysDictionaryType();
	}

	@Override
	public String selectProjectStatusByDicId(Integer dicId) {
		return sysDictionaryMapper.selectProjectStatusByDicId(dicId);
	}

	@Override
	public List<SysDictionary> selectSysDictionaryType_Status() {
		return sysDictionaryMapper.selectSysDictionaryType_Status();
	}

	@Override
	public List<SysDictionary> selectSysDictionaryByProjectTypeId(
			Integer projectTypeId) {
		return sysDictionaryMapper.selectSysDictionaryByProjectTypeId(projectTypeId);
	}

}
