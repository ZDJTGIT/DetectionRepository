package com.zhongda.detection.web.task;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.zhongda.detection.web.model.Message;

@Component
public class PushMessage {
	
	//存放所有登录用户信息
	public static Set<String> userSet = new HashSet<String>();
	
	@Resource
	private SimpMessagingTemplate template;
	
	@Scheduled(cron="0/30 * * * * ?")
	public void createPHMessage(){
		
		//构建消息实体
		Message message = new Message();
		message.setUserId(1);
		message.setSensorId(2);
		message.setStatus("未读");
		message.setMessageType("告警");
		message.setCreateTime(new Date());
		//构建消息内容
		StringBuffer messageContext = new StringBuffer();
		messageContext.append("你好，对位于");
		messageContext.append("罗杰家的农田项目下的的");
		messageContext.append("测点1的PH值监控发现，编号为");
		messageContext.append("123456的测点处的PH值为");
		messageContext.append("4.4，超过警戒值范围（4.5-6.5），对应传感器编号为");
		messageContext.append("11111，型号为");
		messageContext.append("SM108,请及时处理!");
		message.setMessageContext(messageContext.toString());
		
		for (String userName : userSet) {
			System.out.println(message.getMessageContext());
			System.out.println("向--"+userName+"--推送消息");
			//推送消息当前登录用户的客户端
			template.convertAndSendToUser(userName, "/message", message);
			System.out.println("-----------------------------------消息已推送-------------------------------------------");
		}
	}
}
