package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.ProjectMapper;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.service.ProjectService;

/**
 *<p>项目 业务 实现类</p>
 * @author zmdeng
 * @date 2017年9月25日
 */
@Service
public class ProjectServiceImpl implements ProjectService{

	@Resource
	private ProjectMapper projectMapper;

	@Override
	public List<Project> selectProjectsByUserIdAndProjectType(Integer userId,
			Integer projectTypeId) {
		return projectMapper.selectProjectsByUserIdAndProjectType(userId, projectTypeId);
	}

}
