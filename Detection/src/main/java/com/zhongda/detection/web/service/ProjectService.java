package com.zhongda.detection.web.service;

import java.util.List;
import java.util.Map;

import com.zhongda.detection.web.model.Project;

/**
 * <p>
 * 项目 业务 接口
 * </p>
 * 
 * @author zmdeng
 * @date 2017年9月25日
 */
public interface ProjectService {

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
	 * 查询所有根据用户Id
	 * 
	 * @param userId
	 * @return
	 */
	Map<String, List<Project>> selectProjectAndSysDicByUserId(Integer userId);
	
	List<Project> selectProjectAndSysDicByUserIds(Integer userId);

}
