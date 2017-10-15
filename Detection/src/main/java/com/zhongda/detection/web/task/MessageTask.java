package com.zhongda.detection.web.task;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.zhongda.detection.core.utils.SimpleMailSender;
import com.zhongda.detection.web.model.FarmlandPH;
import com.zhongda.detection.web.model.Message;
import com.zhongda.detection.web.service.FarmlandPHService;
import com.zhongda.detection.web.service.MessageService;

@Component
public class MessageTask {

	@Resource
	private FarmlandPHService farmlandPHService;

	@Resource
	private MessageService messageService;
	
	@Scheduled(cron="0 5 0/3 * * ?")
	public void createPHMessage(){
		float minData = 4.5F;
		float maxData = 6.5F;
		List<FarmlandPH> farmlandPHList = farmlandPHService.selectFarmlandPHWithExceedThreshold(minData, maxData);
		for (FarmlandPH farmlandPH : farmlandPHList) {
			//构建消息实体
			Message message = new Message();
			message.setUserId(farmlandPH.getUser().getUserId());
			message.setSensorId(farmlandPH.getSensorInfo().getSensorId());
			message.setStatus("未读");
			message.setMessageType("告警");
			message.setCreateTime(farmlandPH.getDetectionTime());
			//构建消息内容
			StringBuffer messageContext = new StringBuffer();
			messageContext.append("你好，对位于");
			messageContext.append(farmlandPH.getProject().getProjectAddress()+"的农田项目下的的");
			messageContext.append(farmlandPH.getProject().getProjectName()+"的PH值监控发现，编号为");
			messageContext.append(farmlandPH.getSensorInfo().getDetectionId()+"的测点处的PH值为");
			messageContext.append(farmlandPH.getDetectionData()+"，超过警戒值范围（4.5-6.5），对应传感器编号为");
			messageContext.append(farmlandPH.getSensorInfo().getSensorNum()+"，型号为");
			messageContext.append(farmlandPH.getSensorInfo().getSensorModel()+",请及时处理!");
			message.setMessageContext(messageContext.toString());

			messageService.insertMessage(message);
			SimpleMailSender sender = new SimpleMailSender();
			sender.send(farmlandPH.getUser().getEmail(), "中大检测平台告警", messageContext);
			
		}
	}
}
