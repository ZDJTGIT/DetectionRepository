package com.zhongda.detection.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

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
	public String messageList(HttpServletRequest request, Model model) {
		//查出当前用户下所有未读的消息
		User user = (User) WebUtils.getSessionAttribute(request, "userInfo");
		List<Message> messageList = messageService.selectMessagesByUserIdAndNotRead(user.getUserId());
		model.addAttribute("messageList", messageList);
		return "messageList";
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
