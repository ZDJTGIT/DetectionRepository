package com.zhongda.detection.web.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.SysDictionaryMapper;
import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.service.SysDictionaryService;

@Service
public class SysDictionaryServiceImpl implements SysDictionaryService {

	@Resource
	private SysDictionaryMapper sysDictionaryMapper;

	@Override
	public SysDictionary selectByPrimaryKey(Integer dicId) {
		return sysDictionaryMapper.selectByPrimaryKey(dicId);
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

	@Override
	public List<SysDictionary> selectSysDictionaryByAlarmTypeAndStatus(
			String alarmType, String alarmStatus) {
		return sysDictionaryMapper.selectSysDictionaryByAlarmTypeAndStatus(alarmType, alarmStatus);
	}
	
	@Override
	public List<SysDictionary> selectSysDictionaryByTypeCode(Integer typeCode) {
		return sysDictionaryMapper.selectSysDictionaryByTypeCode(typeCode);

	}

	@Override
	public List<SysDictionary> selectAllDetectionType() {
		return sysDictionaryMapper.selectAllDetectionType();
	}

}
