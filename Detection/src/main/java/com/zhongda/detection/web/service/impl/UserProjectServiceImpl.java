package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.UserProjectMapper;
import com.zhongda.detection.web.model.UserProject;
import com.zhongda.detection.web.service.UserProjectService;

@Service
public class UserProjectServiceImpl implements UserProjectService {

	@Resource
	private UserProjectMapper userProjectMapper;

	@Override
	public List<UserProject> selectAllProjectTypeByUserId(Integer userId) {
		return userProjectMapper.selectAllProjectTypeByUserId(userId);
	}

	@Override
	public List<UserProject> selectAllProjectByUserIdAndProjectType(
			Integer userId, String projectType) {
		return userProjectMapper.selectAllProjectByUserIdAndProjectType(userId,
				projectType);
	}

	@Override
	public UserProject selectProjectByUserIdAndProjectInfo(Integer userId,
			String projectType, Integer projectId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<UserProject> selectAllProjectByIdAndType(Integer userId,
			String projectType) {
		return userProjectMapper.selectAllProjectByIdAndType(userId,
				projectType);
	}

}
