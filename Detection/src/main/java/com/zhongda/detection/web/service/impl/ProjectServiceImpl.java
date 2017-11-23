package com.zhongda.detection.web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
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
			String key = project.getSysDictionary().getItemName() + ","
					+ project.getSysDictionary().getItemValue();
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
	public Map<String, List<Project>> selectAllProjects() {
		List<Project> projectList = projectMapper.selectAllProjects();
		Map<String, List<Project>> projectMap = new HashMap<String, List<Project>>();
		for (Project project : projectList) {
			String key = project.getSysDictionary().getItemName() + ","
					+ project.getSysDictionary().getItemValue();
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
	public List<Project> selectProjectWithAlarmCount(Project project) {
		if (null != project.getPageNum() && null != project.getPageSize()) {
			PageHelper.startPage(project.getPageNum(), project.getPageSize());
		}
		return projectMapper.selectProjectWithAlarmCount(project);
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
	public int deleteByUserId(Integer userId) {
		return projectMapper.deleteByUserId(userId);
	}

	@Override
	public Project selectProjectAndSysdicByTwoId(Integer projectId,
			Integer detectionTypeId) {
		return projectMapper.selectProjectAndSysdicByTwoId(projectId,
				detectionTypeId);
	}

	@Override
	public Project selectDetectionCount(Integer projectId) {
		return projectMapper.selectDetectionCount(projectId);
	}

	@Override
	public Project selectSensorInfoCount(Integer projectId) {
		return projectMapper.selectSensorInfoCount(projectId);
	}

	@Override
	public Project selectThresholdCount(Integer projectId) {
		return projectMapper.selectThresholdCount(projectId);
	}

	@Override
	public Project selectImageCount(Integer projectId) {
		return projectMapper.selectImageCount(projectId);
	}

	@Override
	public Project selectAlarmCount(Integer projectId) {
		return projectMapper.selectAlarmCount(projectId);
	}

	@Override
	public List<Project> selectUsersProjectWithAlarmCount(Project project) {
		if (null != project.getPageNum() && null != project.getPageSize()) {
			PageHelper.startPage(project.getPageNum(), project.getPageSize());
		}
		return projectMapper.selectUsersProjectWithAlarmCount(project);
	}

	@Override
	public Project selectAlarmDetectionPointCount(Integer projectId) {
		return projectMapper.selectAlarmDetectionPointCount(projectId);
	}

	@Override
	public Project selectAlarmSensorInfoCount(Integer projectId) {
		return projectMapper.selectAlarmSensorInfoCount(projectId);
	}

	@Override
	public Project selectAlarmAlarmCount(Integer projectId) {
		return projectMapper.selectAlarmAlarmCount(projectId);
	}

}
