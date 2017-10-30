package com.zhongda.detection.web.task;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.zhongda.detection.core.utils.SimpleMailSender;
import com.zhongda.detection.core.utils.sms.SmsSender;
import com.zhongda.detection.web.model.Alarm;
import com.zhongda.detection.web.model.AlarmLinkman;
import com.zhongda.detection.web.service.AlarmService;

@Component
public class PushAlarm {

	// 存放所有登录用户信息
	public static Set<String> userSet = new HashSet<String>();

	@Resource
	private AlarmService alarmService;
	
	@Resource
	private SimpMessagingTemplate template;

	@Scheduled(cron = "0/30 * * * * ?")
	public void push() {
		
		List<Alarm> alarmList = alarmService.selectAlarmAndLinkmanPeriod();
		for (Alarm alarm : alarmList) {
			List<String> phoneNumbers = null;
			List<String> emails = null;
			List<String> params = new ArrayList<String>();
			//如果是数据类告警
			if(alarm.getAlarmTypeId() == 17){
				params.add(alarm.getUserName());
				params.add(alarm.getProjectName());
				params.add(alarm.getSensorId().toString());
				params.add(alarm.getAlarmType());
				String[] contextArray = alarm.getAlarmContext().split("，");
				params.add(contextArray[0].substring(3));
				String[] thresholdArray = contextArray[2].split("~");
				params.add(thresholdArray[0].substring(4));
				params.add(thresholdArray[1]);
			}else if(alarm.getAlarmTypeId() == 18){ //如果是设备类告警
				params.add(alarm.getUserName());
				params.add(alarm.getProjectName());
				params.add(alarm.getSensorId().toString());
			}
			//如果当前项目有对应的告警联系人
			if(null != alarm.getAlarmLinkmans() && alarm.getAlarmLinkmans().size() > 0){
				phoneNumbers = new ArrayList<String>();
				emails = new ArrayList<String>();
				//循环取出所有告警联系人的手机号码和邮箱地址
				for (AlarmLinkman alarmLinkman : alarm.getAlarmLinkmans()) {
					phoneNumbers.add(alarmLinkman.getPhone());
					emails.add(alarmLinkman.getEmail());
				}
			}else{ //如果当前项目没有对应的告警联系人 
				System.out.println(params.get(1)+"没有对应的告警联系人");
			}
			//群发邮件
//			SimpleMailSender mailSender = new SimpleMailSender();
//			mailSender.send(emails, SimpleMailSender.ALARM_DATA_MESSAGE, params);
			//群发短信
//			SmsSender smsSender = new SmsSender();
//			smsSender.send(51869, phoneNumbers, params);
			//如果该消息对应项目的账户在线，则向其登录的客户端推送消息
			if(userSet.contains(alarm.getUserName())){
				String message = MessageFormat.format("尊敬的{0}用户：您好！您的{1}项目，编号为：{2}的传感器监测到{3}超过阈值，当前值{4}，阈值范围{5}~{6}。", params.toArray());
				alarm.setAlarmContext(message);
				template.convertAndSendToUser(alarm.getUserName(), "/message", alarm);
			}
					
		}
	}
}
