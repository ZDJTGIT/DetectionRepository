package com.zhongda.detection.web.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.zhongda.detection.core.utils.sms.SmsContentTemplate;
import com.zhongda.detection.core.utils.sms.SmsSender;
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
	public List<Alarm> selectPageAlarmByQuery(Alarm alarm) {
		PageHelper.startPage(alarm.getPageNum(), alarm.getPageSize());
		return alarmMapper.selectPageAlarmByQuery(alarm);
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
	public Result<Alarm> updateAlarmStatus(Integer alarmId) {
		int index = alarmMapper.updateAlarmStatus(alarmId);
		Result<Alarm> result = new Result<Alarm>();
		if(index > 0){
			result.setCode(Result.SUCCESS);
			result.setMsg("修改状态成功");
		}else{
			result.setCode(Result.FAILURE);
			result.setMsg("修改状态失败");
		}
		return result;
	}

	@Override
	public Result<Alarm> updateBatchAlarmStatus(String alarmIds) {
		List<Integer> list = new ArrayList<Integer>();
		String[] alarmIdArray = alarmIds.split(",");
		Result<Alarm> result = new Result<Alarm>();
		for (String alarmId : alarmIdArray) {
			if(null != alarmId && !alarmId.trim().equals("")){
				list.add(Integer.parseInt(alarmId));
			}
		}
		int index = alarmMapper.updateBatchAlarmStatus(list);
		if(index > 0){
			result.setCode(Result.SUCCESS);
			result.setMsg("修改状态成功");
		}else{
			result.setCode(Result.FAILURE);
			result.setMsg("修改状态失败");
		}		
		return result;
	}

	@Override
	public Result<Alarm> updateBatchAlarmStatusByQuery(Alarm alarm) {
		int index = alarmMapper.updateBatchAlarmStatusByQuery(alarm);
		Result<Alarm> result = new Result<Alarm>();
		if(index > 0){
			result.setCode(Result.SUCCESS);
			result.setMsg("修改状态成功");
		}else{
			result.setCode(Result.FAILURE);
			result.setMsg("修改状态失败");
		}		
		return result;
	}

	@Override
	public Result<String> alarmManualTriggerSms(Integer alarmId, String phone) {
		Result<String> result = new Result<String>();
		result.setCode(Result.FAILURE);
		result.setMsg("发送短信失败");
		Alarm alarm = alarmMapper.selectByPrimaryKey(alarmId);
		List<String> params = new ArrayList<String>();
		params.add(alarm.getUserName());
		params.add(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(alarm
				.getCreateTime()));
		params.add("沉降");
		params.add(alarm.getProjectName());
		params.add(alarm.getSmuCmsId());
		params.add(alarm.getSensorId());
		// 如果是数据类告警
		if (alarm.getAlarmTypeId() == 17) {
			String[] contextArray = alarm.getAlarmContext().split("，");
			params.add(contextArray[0].split("：")[1]);
			String[] thresholdArray = contextArray[2].split("~");
			params.add(thresholdArray[0].substring(5));
			params.add(thresholdArray[1]);
		} else if (alarm.getAlarmTypeId() == 18) { // 如果是设备类告警
			params.add(alarm.getAlarmContext());
		}
		SmsSender smsSender = new SmsSender();
		// 如果是数据类告警
		if (alarm.getAlarmTypeId() == 17) {
			// 群发短信
			smsSender.send(SmsContentTemplate.ALARM_DATA_MESSAGE,
					phone, params);
		} else if (alarm.getAlarmTypeId() == 18) { // 如果是设备类告警
			// 群发短信
			smsSender.send(SmsContentTemplate.ALARM_DEVICE_MESSAGE,
					phone, params);
		}
		result.setCode(Result.SUCCESS);
		result.setMsg("发送短信成功");
		return result;
	}
}
