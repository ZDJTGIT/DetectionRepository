package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.UserProjectMapper;
import com.zhongda.detection.web.model.UserProject;
import com.zhongda.detection.web.service.UserProjectService;

@Service
public class UserProjectServiceImpl implements UserProjectService{

	@Resource
	private UserProjectMapper userProjectMapper;

	@Override
	public List<UserProject> selectAllProjectTypeByUserId(Integer userId) {
		return userProjectMapper.selectAllProjectTypeByUserId(userId);
	}


}
