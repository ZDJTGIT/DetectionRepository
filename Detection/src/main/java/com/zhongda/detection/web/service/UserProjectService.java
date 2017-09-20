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
}
