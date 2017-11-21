package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.zhongda.detection.web.dao.AlarmMapper;
import com.zhongda.detection.web.model.Alarm;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.Result;
import com.zhongda.detection.web.service.AlarmService;

/**
 * 告警Service实现类
 */
@Service
public class AlarmServiceImpl implements AlarmService{
	
	 @Resource
	 private AlarmMapper alarmMapper;

	@Override
	public List<Alarm> selectAlarmAndLinkmanPeriod() {
		return alarmMapper.selectAlarmAndLinkmanPeriod();
	}

	@Override
	public List<Alarm> selectPageAlarmByUserIdAndNotConfirm(Integer userId, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return alarmMapper.selectAlarmByUserIdAndNotConfirm(userId);
	}

	@Override
	public List<Alarm> selectPageAlarmByUserIdAndOtherInfo(Alarm alarm) {
		PageHelper.startPage(alarm.getPageNum(), alarm.getPageSize());
		return alarmMapper.selectPageAlarmByUserIdAndOtherInfo(alarm);
	}

	@Override
	public List<Alarm> selectAlarmByProjectId(Integer projectId) {
		return alarmMapper.selectAlarmByProjectId(projectId);
	}

	@Override
	public List<Alarm> selectAlarmWithAlarmCount(Project project) {
		if (null != project.getPageNum() && null != project.getPageSize()) {
			PageHelper.startPage(project.getPageNum(), project.getPageSize());
		}
		return alarmMapper.selectAlarmWithAlarmCount(project);
	}

	@Override
	public Result updateAlarmStatus(Integer alarmId) {
		int index = alarmMapper.updateAlarmStatus(alarmId);
		Result result = new Result();
		if(index > 0){
			result.setCode(Result.SUCCESS);
			result.setMsg("修改状态成功");
		}else{
			result.setCode(Result.FAILURE);
			result.setMsg("修改状态失败");
		}
		return result;
	}
}
