package com.zhongda.detection.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.zhongda.detection.web.model.User;

@Controller
@RequestMapping(value = "/farmlanpoint")
public class FarmlandPointContorller {

	@RequestMapping(value = "/farm")
	public ModelAndView farm(HttpServletRequest request) {
		User user = (User) WebUtils.getSessionAttribute(request, "userInfo");
		System.out.println(user.getUserName());
		System.out.println("-----------begin");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("test", "hello");
		modelAndView.setViewName("/graph_echarts_farmland");
		System.out.println("----------------end");
		return modelAndView;
	}
}
