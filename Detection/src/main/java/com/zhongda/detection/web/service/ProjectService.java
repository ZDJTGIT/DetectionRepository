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
	List<Project> selectProjectAndSysDicByUserIds(Integer userId);
	
	Map<String, List<Project>> selectProjectAndSysDicByUserId(Integer userId);
	
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
}
