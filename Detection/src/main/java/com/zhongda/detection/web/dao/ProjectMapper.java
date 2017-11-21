package com.zhongda.detection.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhongda.detection.web.model.Project;

public interface ProjectMapper {

	/**
	 * 根据用户ID删除项目（删除用户下所有项目）
	 * 
	 * @param userId
	 * @return
	 */
	int deleteByUserId(Integer userId);

	/**
	 * 根据项目ID删除项目
	 * 
	 * @param projectId
	 * @return
	 */
	int deleteByPrimaryKey(Integer projectId);

	/**
	 * 根据项目ID删除项目以及项目下测点以及测点下传感器以及告警信息表（sql未实现）---
	 * 
	 * @param projectId
	 * @return
	 */
	int deleteAllAboutProjectByProjectId(Integer projectId);

	/**
	 * 插入一条项目信息
	 * 
	 * @param record
	 * @return
	 */
	int insert(Project record);

	/**
	 * 插入一条项目信息
	 * 
	 * @param record
	 * @return
	 */
	int insertSelective(Project record);

	/**
	 * 根据项目ID查项目
	 * 
	 * @param projectId
	 * @return
	 */
	Project selectByPrimaryKey(Integer projectId);

	/**
	 * 根据项目名称查项目
	 * 
	 * @param projectId
	 * @return
	 */
	Project selectByProjectName(String projectName);

	/**
	 * 根据id修改项目信息
	 * 
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(Project record);

	int updateByPrimaryKey(Project record);

	/**
	 * 根据用户id和项目类型id查询出当前用户下对应项目类型的所有项目
	 * 
	 * @param userId
	 * @param projectTypeId
	 * @return
	 */
	List<Project> selectProjectsByUserIdAndProjectType(Integer userId,
			Integer projectTypeId);

	/**
	 * 查询所有通过userID
	 * 
	 * @param userId
	 * @return
	 */
	List<Project> selectProjectAndSysDicByUserId(Integer userId);

	/**
	 * 查询满足Id的所有Project数据
	 * 
	 * @param item
	 * @return
	 */
	List<Project> selectLotOfProjectsByProjectId(Integer[] item);

	/**
	 * 查询所有Project数据
	 * 
	 * @return
	 */
	List<Project> selectAllProject();

	/**
	 * 根据查询条件查询出对应项目包括告警消息条数
	 * 
	 * @param project
	 *            封装了查询条件的对象
	 * @return
	 */
	List<Project> selectProjectWithAlarmCount(Project project);

	/**
	 * 查询属于用户的项目
	 * 
	 * @param project
	 *            封装了查询条件的对象
	 * @return
	 */
	List<Project> selectUsersProjectWithAlarmCount(Project project);

	/**
	 * 根据项目名称和用户ID查询项目
	 * 
	 */
	Project selectProjectByProjectNameAndUserId(String projectName,
			Integer userId);

	/**
	 * 查询字典和项目根据项目ID和字典ID
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	Project selectProjectAndSysdicByTwoId(
			@Param(value = "projectId") Integer projectId,
			@Param(value = "detectionTypeId") Integer detectionTypeId);

	/**
	 * 查项目下测点数量
	 * 
	 * @param projectId
	 * @return
	 */
	Project selectDetectionCount(Integer projectId);

	/**
	 * 查项目下传感器数量
	 * 
	 * @param projectId
	 * @return
	 */
	Project selectSensorInfoCount(Integer projectId);

	/**
	 * 查项目下阀值数量
	 * 
	 * @param projectId
	 * @return
	 */
	Project selectThresholdCount(Integer projectId);

	/**
	 * 查项目下图片记录数量
	 * 
	 * @param projectId
	 * @return
	 */
	Project selectImageCount(Integer projectId);

	/**
	 * 查项目下报警信息数量
	 * 
	 * @param projectId
	 * @return
	 */
	Project selectAlarmCount(Integer projectId);

	/**
	 * 查询所有项目
	 * 
	 * @return
	 */
	List<Project> selectAllProjects();
	/**
	 * 查项目下异常测点数量
	 * @param projectId
	 * @return
	 */
	Project selectAlarmDetectionPointCount(Integer projectId);
	/**
	 * 查项目下异常传感器数量
	 * @param projectId
	 * @return
	 */
	Project selectAlarmSensorInfoCount(Integer projectId);
}