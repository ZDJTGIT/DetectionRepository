package com.zhongda.detection.web.listener;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListenerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.task.PushMessage;

/**
 * ShiroSession监听类
 * @author zmdeng
 */
@Component(value = "shiroSessionListener")
public class ShiroSessionListener extends SessionListenerAdapter{
	
	public static final Logger logger = LoggerFactory.getLogger(ShiroSessionListener.class);
		
	//会话过期时触发
	@Override
	public void onExpiration(Session session) {
		logger.error("会话session过期,sessionId:"+session.getId());
		User user = (User) session.getAttribute("userInfo");
		if(null != user){
			PushMessage.userSet.remove(user.getUserName());
		}
		
	}
	
	//会话停止时触发
	@Override
	public void onStop(Session session) {
		logger.error("会话session停止,sessionId:"+session.getId());
		User user = (User) session.getAttribute("userInfo");
		if(null != user){
			PushMessage.userSet.remove(user.getUserName());
		}
	}
}
