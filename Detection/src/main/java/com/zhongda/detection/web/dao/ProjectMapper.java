package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.Project;
public interface ProjectMapper {
	
	/**
	 * 根据用户ID删除项目（删除用户下所有项目）
	 * @param userId
	 * @return
	 */
	int deleteByUserId(Integer userId);
	
	/**
	 * 根据项目ID删除项目
	 * @param projectId
	 * @return
	 */
	int deleteByPrimaryKey(Integer projectId);
	
	/**
	 * 根据项目ID删除项目以及项目下测点以及测点下传感器以及告警信息表（sql未实现）---
	 * @param projectId
	 * @return
	 */
	int deleteAllAboutProjectByProjectId(Integer projectId);

	/**
	 * 插入一条项目信息
	 * @param record
	 * @return
	 */
	int insert(Project record);

	/**
	 * 插入一条项目信息
	 * @param record
	 * @return
	 */
	int insertSelective(Project record);

	/**
	 * 根据项目ID查项目
	 * @param projectId
	 * @return
	 */
	Project selectByPrimaryKey(Integer projectId);
	
	/**
	 * 根据项目名称查项目
	 * @param projectId
	 * @return
	 */
	Project selectByProjectName(String projectName);

	/**
	 * 根据id修改项目信息
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
	 * @return
	 */
	List<Project> selectAllProject();
	
	/**
	 * 根据用户id查询出当前用户下对应的所有项目包括告警消息条数
	 * @param userId
	 * @return
	 */
	List<Project> selectProjectByUserIdWithMessageCount(Integer userId);
	
	/**
	 * 查询出所有项目包括告警消息条数
	 * @return
	 */
	List<Project> selectAllProjectWithMessageCount();
	
	/**
	 * 根据关键字查询项目(管理员)
	 * @return
	 */
	List<Project> selectAllProjectByKeyWord_mana(String keyWord);
	
	/**
	 * 根据关键字查询项目(非管理员)
	 * @return
	 */
	List<Project> selectAllProjectByKeyWord_nomana(String keyWord,Integer userId);
	
	/**
	 * 根据项目名称和用户ID查询项目
	 * 
	 */
	Project selectProjectByProjectNameAndUserId(String projectName ,Integer userId);
}