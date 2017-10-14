package com.zhongda.detection.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.zhongda.detection.web.model.Message;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.service.MessageService;

/**
 *<p>消息视图控制器</p>
 * @author zmdeng
 * @date 2017年9月28日
 */
@Controller
@RequestMapping(value = "/message")
public class MessageController {

	public static final Logger logger = LoggerFactory
			.getLogger(MessageController.class);

	@Resource
	private MessageService messageService;

	@RequestMapping("/messageList")
	public String messageList() {
		//进入消息列表页
		return "messageList";
	}	
	
	@RequestMapping("/messagePageList")
	@ResponseBody
	public Map<String, Object> messagePageList(@RequestBody Message message, HttpServletRequest request) {
		System.out.println(message.getMessageId()+"---"+message.getMessageType()+"---"+message.getMessageContext()+"---"+message.getStatus());
		//查出当前用户下所有未读的消息
		User user = (User) WebUtils.getSessionAttribute(request, "userInfo");
		message.setUserId(user.getUserId());
		message.setMessageType("1".equals(message.getMessageType())?"告警":null);
		if(null != message.getStatus()){
			message.setStatus("1".equals(message.getStatus())?"已读":"未读");
		}
		List<Message> messageList = messageService.selectMessagesByUserIdAndOther(message);
		PageInfo<Message> messagePageInfo=new PageInfo<Message>(messageList);
		Map<String, Object> messageMap = new HashMap<String, Object>();
		messageMap.put("total", messagePageInfo.getTotal());
		messageMap.put("messageList", messageList);
		return messageMap;
	}

	@RequestMapping("/messageListJson")
	@ResponseBody
	public List<Message> messageListJson(HttpServletRequest request, Model model) {
		//查出当前用户下所有未读的消息
		User user = (User) WebUtils.getSessionAttribute(request, "userInfo");
		List<Message> messageList = messageService.selectMessagesByUserIdAndNotRead(user.getUserId());
		return messageList;
	}
}
