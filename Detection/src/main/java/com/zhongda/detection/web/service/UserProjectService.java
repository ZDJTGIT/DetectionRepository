package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.UserProject;

public interface UserProjectService {

	/**
	 * 查出当前用户下所有的项目类型
	 * @param userId
	 * @return
	 */
	List<UserProject> selectAllProjectTypeByUserId(Integer userId);

	/**
	 * 查出当前用户下对应项目类型的所有项目
	 * @param userId
	 * @param projectType
	 * @return
	 */
	List<UserProject> selectAllProjectByUserIdAndProjectType(
			Integer userId, String projectType);

	/**
	 * 查出当前用户下对应项目类型和项目id的项目
	 * @param userId
	 * @param projectType
	 * @param projectId
	 * @return
	 */
	UserProject selectProjectByUserIdAndProjectInfo(Integer userId,
			String projectType, Integer projectId);
}
