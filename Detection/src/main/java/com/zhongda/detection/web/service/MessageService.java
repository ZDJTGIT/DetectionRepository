package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.Message;

/**
 *<p>消息 业务 接口</p>
 * @author zmdeng
 * @date 2017年9月27日
 */
public interface MessageService {

	/**
	 * 插入一条消息
	 * @param message
	 */
	void insertMessage(Message message);

	/**
	 * 查出当前用户下所有未读的消息
	 * @param userId
	 * @return
	 */
	List<Message> selectMessagesByUserIdAndNotRead(Integer userId);

	/**
	 * 查出当前用户下部分未读的消息（默认两条）
	 * @param userId
	 * @return
	 */
	List<Message> selectPartMessagesByUserIdAndNotRead(Integer userId);

}
