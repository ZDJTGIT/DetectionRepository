package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.AlarmLinkmanMapper;
import com.zhongda.detection.web.model.AlarmLinkman;
import com.zhongda.detection.web.service.AlarmLinkmanService;

@Service
public class AlarmLinkmanServiceImpl implements AlarmLinkmanService {

	@Resource
	private AlarmLinkmanMapper alarmLinkmanMapper;

	@Override
	public List<AlarmLinkman> selectAll() {
		return alarmLinkmanMapper.selectAll();
	}

	@Override
	public int insertAlarmLinkmanList(List<AlarmLinkman> alarList) {
		return alarmLinkmanMapper.insertAlarmLinkmanList(alarList);
	}

	@Override
	public int updateStatusByalarmLinkmanId(Integer status,
			Integer alarmLinkmanId) {
		return alarmLinkmanMapper.updateStatusByalarmLinkmanId(status,
				alarmLinkmanId);
	}

	@Override
	public int deleteByPrimaryKey(Integer alarmLinkmanId) {
		return alarmLinkmanMapper.deleteByPrimaryKey(alarmLinkmanId);
	}

}
