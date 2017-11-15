package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.AlarmLinkman;

public interface AlarmLinkmanService {

	/**
	 * 查询所有数据
	 * 
	 * @return
	 */
	List<AlarmLinkman> selectAll();

	/**
	 * 批量插入AlarmLinkman对象
	 * 
	 * @param alarList
	 * @return
	 */
	int insertAlarmLinkmanList(List<AlarmLinkman> alarList);

	/**
	 * 修改联系人状态
	 * 
	 * @param status
	 * @param alarmLinkmanId
	 * @return
	 */
	int updateStatusByalarmLinkmanId(Integer status, Integer alarmLinkmanId);

	/**
	 * 删除联系人通过ID
	 * 
	 * @param alarmLinkmanId
	 * @return
	 */
	int deleteByPrimaryKey(Integer alarmLinkmanId);
}
