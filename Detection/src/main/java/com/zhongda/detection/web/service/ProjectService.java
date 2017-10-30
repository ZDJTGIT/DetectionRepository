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
	 * 根据用户ID删除项目（删除用户下所有项目）
	 * @param userId
	 * @return
	 */
	int deleteByUserId(Integer userId);

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
	 * 根据项目ID删除项目
	 * @param projectId
	 * @return
	 */
	int deleteByPrimaryKey(Integer projectId);
	
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
	
	/**
	 * 根据项目名称和用户ID查询项目
	 * 
	 */
	Project selectProjectByProjectNameAndUserId(String projectName ,Integer userId);
}
