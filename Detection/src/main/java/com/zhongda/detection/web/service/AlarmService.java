package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.Alarm;

/**
 * <p>告警 业务 接口</p>
 * @author zmdeng
 */
public interface AlarmService {
	
	/**
	 * 查询出距离现在某段时间内发生的所有告警信息包括对应的告警联系人的信息
	 * @return
	 */
	List<Alarm> selectAlarmAndLinkmanPeriod();
	
	/**
	 * 分页查询出当前用户下未确认的告警信息
	 * @param userId 用户id
	 * @param pageNum 当前页
	 * @param pageSize 每页记录数
	 * @return
	 */
	List<Alarm> selectPageAlarmByUserIdAndNotConfirm(Integer userId, Integer pageNum, Integer pageSize);
	
	/**
	 * 根据查询条件分页查询出当前用户下的告警信息
	 * @param alarm 封装了查询条件的alarm对象(包含当前页和每页记录数)
	 * @return
	 */
	List<Alarm> selectPageAlarmByUserIdAndOtherInfo(Alarm alarm);
	
}
