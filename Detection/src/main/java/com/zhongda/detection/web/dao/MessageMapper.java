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
}