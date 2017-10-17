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
	 * 分页查出当前用户下未读的消息
	 * 默认第一页，每页10条记录
	 * @param userId
	 * @return
	 */
	List<Message> selectMessagesByUserIdAndNotRead(Integer userId);
	
	/**
	 * 分页查出当前用户下未读的消息
	 * @param userId 当前用户id
	 * @param pageNum 当前页码
	 * @param pageSize 每页多少条记录
	 * @return
	 */
	List<Message> selectMessagesByUserIdAndNotRead(Integer userId, Integer pageNum, Integer pageSize);

	/**
	 * 查出当前用户下部分未读的消息（默认两条）
	 * @param userId
	 * @return
	 */
	List<Message> selectPartMessagesByUserIdAndNotRead(Integer userId);
	
	/**
	 * 根据查询条件查询当前用户下的消息
	 * @param message
	 * @return
	 */
	List<Message> selectMessagesByUserIdAndOther(Message message);
	
	/**
	 * 根据项目ID查询当前项目的所有告警信息
	 * @param projectId
	 * @return
	 */
	List<Message> selectAllMessageByProjectId(Integer projectId);
	
}
