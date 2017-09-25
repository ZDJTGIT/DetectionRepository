package com.zhongda.detection.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhongda.detection.web.model.UserProject;

public interface UserProjectMapper {
	int deleteByPrimaryKey(Integer userProjectId);

	int insert(UserProject record);

	int insertSelective(UserProject record);

	UserProject selectByPrimaryKey(Integer userProjectId);

	int updateByPrimaryKeySelective(UserProject record);

	int updateByPrimaryKey(UserProject record);

	/**
	 * 查出当前用户下所有的项目类型
	 * 
	 * @param userId
	 * @return
	 */
	List<UserProject> selectAllProjectTypeByUserId(Integer userId);

	/**
	 * 查出当前用户下对应项目类型的所有项目
	 * 
	 * @param userId
	 * @param projectType
	 * @return
	 */
	List<UserProject> selectAllProjectByUserIdAndProjectType(Integer userId,
			String projectType);

	/**
	 * 查询所有通过用户ID和项目类型
	 * 
	 * @param userId
	 * @param projectType
	 * @return
	 */
	List<UserProject> selectAllProjectByIdAndType(
			@Param(value = "userId") Integer userId,
			@Param(value = "projectType") String projectType);
}