package com.zhongda.detection.web.task;

import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;

import com.zhongda.detection.core.utils.SimpleMailSender;
import com.zhongda.detection.core.utils.sms.SmsContentTemplate;
import com.zhongda.detection.core.utils.sms.SmsSender;
import com.zhongda.detection.web.model.Alarm;
import com.zhongda.detection.web.model.AlarmLinkman;
import com.zhongda.detection.web.service.AlarmService;

//@Component
public class PushAlarm {

	// 存放所有登录用户信息
	public static Set<String> userSet = new HashSet<String>();

	@Resource
	private AlarmService alarmService;

	@Resource
	private SimpMessagingTemplate template;

	@Scheduled(cron = "0 0/10 * * * ?")
	public void push() {

		List<Alarm> alarmList = alarmService.selectAlarmAndLinkmanPeriod();
		for (Alarm alarm : alarmList) {
			List<String> phoneNumbers = null;
			List<String> emails = null;
			List<String> params = new ArrayList<String>();
			params.add(alarm.getUserName());
			params.add(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(alarm
					.getCreateTime()));
			params.add(alarm.getDetectionType());
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
			// 如果当前项目有对应的告警联系人
			if (null != alarm.getAlarmLinkmans()
					&& alarm.getAlarmLinkmans().size() > 0) {
				phoneNumbers = new ArrayList<String>();
				emails = new ArrayList<String>();
				// 循环取出所有告警联系人的手机号码和邮箱地址
				for (AlarmLinkman alarmLinkman : alarm.getAlarmLinkmans()) {
					phoneNumbers.add(alarmLinkman.getPhone());
					emails.add(alarmLinkman.getEmail());
				}
			} else { // 如果当前项目没有对应的告警联系人
				SimpleMailSender mailSender1 = new SimpleMailSender();
				mailSender1.send("731583657@qq.com", "告警",
						alarm.getProjectName() + "没有对应的告警联系人");
			}
			SimpleMailSender mailSender = new SimpleMailSender();
			SmsSender smsSender = new SmsSender();
			// 如果是数据类告警
			if (alarm.getAlarmTypeId() == 17) {
				// 群发邮件
				mailSender.send(emails, SimpleMailSender.ALARM_DATA_MESSAGE,
						params);
				// 群发短信
				smsSender.send(SmsContentTemplate.ALARM_DATA_MESSAGE,
						phoneNumbers, params);
			} else if (alarm.getAlarmTypeId() == 18) { // 如果是设备类告警
				// 群发邮件
				mailSender.send(emails, SimpleMailSender.ALARM_DEVICE_MESSAGE,
						params);
				// 群发短信
				smsSender.send(SmsContentTemplate.ALARM_DEVICE_MESSAGE,
						phoneNumbers, params);
			}
			// 如果该消息对应项目的账户在线，则向其登录的客户端推送消息
			if (userSet.contains(alarm.getUserName())) {
				String message = null;
				// 如果是数据类告警
				if (alarm.getAlarmTypeId() == 17) {
					message = MessageFormat
							.format("尊敬的{0}用户：您好！您的项目于{1}监测到数据类告警：{2}超过阈值。项目名称：{3}，采集终端：{4}，传感器编号：{5}，当前监测值：{6}，正常值范围:{7}~{8}。",
									params.toArray());
				} else if (alarm.getAlarmTypeId() == 18) { // 如果是设备类告警
					message = MessageFormat
							.format("尊敬的{0}用户：您好！您的项目于{1}监测到数据类告警：{2}超过阈值。项目名称：{3}，采集终端：{4}，传感器编号：{5}，{6}。",
									params.toArray());
				}
				alarm.setAlarmContext(message);
				template.convertAndSendToUser(alarm.getUserName(), "/message",
						alarm);
			}
		}
	}
}
