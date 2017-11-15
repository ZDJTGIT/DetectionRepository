package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.Alarm;
import com.zhongda.detection.web.model.Project;

public interface AlarmMapper {
    int deleteByPrimaryKey(Integer alarmId);

    int insert(Alarm record);

    int insertSelective(Alarm record);

    Alarm selectByPrimaryKey(Integer alarmId);

    int updateByPrimaryKeySelective(Alarm record);

    int updateByPrimaryKey(Alarm record);
    
    /**
	 * 查询出距离现在某段时间内发生的所有告警信息包括对应的告警联系人的信息
	 * @return
	 */
	List<Alarm> selectAlarmAndLinkmanPeriod();
	
	/**
	 * 查询出当前用户下所有未确认的告警信息
	 * @param userId
	 * @return
	 */
	List<Alarm> selectAlarmByUserIdAndNotConfirm(Integer userId);
	
	/**
	 * 根据查询条件查询出当前用户下的告警信息
	 * @param alarm 封装了查询条件的alarm对象
	 * @return
	 */
	List<Alarm> selectPageAlarmByUserIdAndOtherInfo(Alarm alarm);
	
	/**
	 * 查当前用户下所有告警信息
	 * @param projectId
	 * @return
	 */
	List<Alarm> selectAlarmByProjectId(Integer projectId);
	
	/**
	 * 根据查询条件查询出对应项目下告警信息
	 * 
	 * @param project
	 *            封装了查询条件的对象
	 * @return
	 */
	List<Alarm> selectAlarmWithAlarmCount(Project project);
}