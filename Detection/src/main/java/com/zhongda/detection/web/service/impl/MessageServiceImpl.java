package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.MessageMapper;
import com.zhongda.detection.web.model.Message;
import com.zhongda.detection.web.service.MessageService;

/**
 *<p消息 业务 实现类</p>
 * @author zmdeng
 * @date 2017年9月27日
 */
@Service
public class MessageServiceImpl implements MessageService{

	@Resource
	private MessageMapper messageMapper;

	@Override
	public void insertMessage(Message message) {
		messageMapper.insert(message);
	}

	@Override
	public List<Message> selectMessagesByUserIdAndNotRead(Integer userId) {
		return  messageMapper.selectMessagesByUserIdAndNotRead(userId);
	}

	@Override
	public List<Message> selectPartMessagesByUserIdAndNotRead(Integer userId) {
		return messageMapper.selectPartMessagesByUserIdAndNotRead(userId);
	}

}
