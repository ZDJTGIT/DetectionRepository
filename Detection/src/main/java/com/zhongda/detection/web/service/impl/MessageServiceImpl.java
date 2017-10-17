package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
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
		return  selectMessagesByUserIdAndNotRead(userId, 1, 10);
	}
	
	@Override
	public List<Message> selectMessagesByUserIdAndNotRead(Integer userId, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		return  messageMapper.selectMessagesByUserIdAndNotRead(userId);
	}

	@Override
	public List<Message> selectPartMessagesByUserIdAndNotRead(Integer userId) {
		return messageMapper.selectPartMessagesByUserIdAndNotRead(userId);
	}

	@Override
	public List<Message> selectMessagesByUserIdAndOther(Message message) {
		PageHelper.startPage(message.getPageNum(), message.getPageSize());
		return  messageMapper.selectMessagesByUserIdAndOther(message);
	}

	@Override
	public List<Message> selectAllMessageByProjectId(Integer projectId) {
		return messageMapper.selectAllMessageByProjectId(projectId);
	}
}
