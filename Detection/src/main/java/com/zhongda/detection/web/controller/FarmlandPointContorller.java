package com.zhongda.detection.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.model.UserProject;
import com.zhongda.detection.web.service.impl.UserProjectServiceImpl;

@Controller
@RequestMapping(value = "/farmlanpoint")
public class FarmlandPointContorller {

	@Autowired
	private UserProjectServiceImpl userprojectImpl;

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

	@RequestMapping(value = "/projectType")
	public @ResponseBody List<UserProject> projectType(Integer userId) {
		System.out.println("-------------controller---begin");
		System.out.println("userId:" + userId);
		List<UserProject> arrayList = userprojectImpl
				.selectAllProjectByIdAndType(userId, "farmland");

		System.out.println(arrayList.size());
		System.out.println("-------------controller---end");
		return arrayList;
	}
}
