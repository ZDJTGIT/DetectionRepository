package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer messageId);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer messageId);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);

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
	
	/**
	 * 根据查询条件查询当前用户下的消息
	 * @param userId 
	 * @param message
	 * @return
	 */
	List<Message> selectMessagesByUserIdAndOther(Message message);
}