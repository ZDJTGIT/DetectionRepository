package com.zhongda.detection.web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.ProjectMapper;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.service.ProjectService;

/**
 * <p>
 * 项目 业务 实现类
 * </p>
 * 
 * @author zmdeng
 * @date 2017年9月25日
 */
@Service
public class ProjectServiceImpl implements ProjectService {

	@Resource
	private ProjectMapper projectMapper;

	@Override
	public List<Project> selectProjectsByUserIdAndProjectType(Integer userId,
			Integer projectTypeId) {
		return projectMapper.selectProjectsByUserIdAndProjectType(userId,
				projectTypeId);
	}

	@Override
	public Map<String, List<Project>> selectProjectAndSysDicByUserId(
			Integer userId) {
		List<Project> projectList = projectMapper
				.selectProjectAndSysDicByUserId(userId);
		Map<String, List<Project>> projectMap = new HashMap<String, List<Project>>();
		for (Project project : projectList) {
			String key = project.getSysDictionary().getItemName();
			List<Project> value = projectMap.get(key);
			if (null == value) {
				value = new ArrayList<Project>();
			}
			value.add(project);
			projectMap.put(key, value);
		}
		return projectMap;
	}

	@Override
	public List<Project> selectProjectAndSysDicByUserIds(Integer userId) {
		return projectMapper.selectProjectAndSysDicByUserId(userId);
	}

	@Override
	public List<Project> selectAllProject() {
		return projectMapper.selectAllProject();
	}

	@Override
	public List<Project> selectProjectByUserIdWithMessageCount(Integer userId) {
		return projectMapper.selectProjectByUserIdWithMessageCount(userId);
	}

	@Override
	public List<Project> selectAllProjectWithMessageCount() {
		return projectMapper.selectAllProjectWithMessageCount();
	}

	@Override
	public List<Project> selectAllProjectByKeyWord_mana(String keyWord) {
		return projectMapper.selectAllProjectByKeyWord_mana(keyWord);
	}

	@Override
	public List<Project> selectAllProjectByKeyWord_nomana(String keyWord,
			Integer userId) {
		return projectMapper.selectAllProjectByKeyWord_nomana(keyWord, userId);
	}

	@Override
	public int insert(Project record) {
		return projectMapper.insert(record);
	}

	@Override
	public int insertSelective(Project record) {
		return projectMapper.insertSelective(record);
	}

	@Override
	public int deleteByPrimaryKey(Integer projectId) {
		return projectMapper.deleteByPrimaryKey(projectId);
	}

	@Override
	public Project selectByPrimaryKey(Integer projectId) {
		return projectMapper.selectByPrimaryKey(projectId);
	}

	@Override
	public Project selectByProjectName(String projectName) {
		return projectMapper.selectByProjectName(projectName);
	}

	@Override
	public int updateByPrimaryKeySelective(Project record) {
		return projectMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public Project selectProjectByProjectNameAndUserId(String projectName,
			Integer userId) {
		return projectMapper.selectProjectByProjectNameAndUserId(projectName,
				userId);
	}

	@Override
	public List<Project> selectProjectWithMessageCount() {
		return projectMapper.selectProjectWithMessageCount();
	}

}
