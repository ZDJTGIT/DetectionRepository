package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.Project;

public interface ProjectMapper {
	int deleteByPrimaryKey(Integer projectId);

	int insert(Project record);

	int insertSelective(Project record);

	Project selectByPrimaryKey(Integer projectId);

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
}