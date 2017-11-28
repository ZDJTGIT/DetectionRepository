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
	 * 
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
	 * 
	 * @return
	 */
	List<Project> selectAllProject();

	/**
	 * 分页查询出项目包括告警消息条数
	 * 
	 * @param project
	 *            封装查询条件
	 * @return
	 */
	List<Project> selectProjectWithAlarmCount(Project project);

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
	 * 根据项目ID删除项目
	 * 
	 * @param projectId
	 * @return
	 */
	int deleteByPrimaryKey(Integer projectId);

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
	Project selectProjectAndSysdicByTwoId(Integer projectId,
			Integer detectionTypeId);

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
	 * 查询属于用户的项目
	 * 
	 * @param project
	 *            封装了查询条件的对象
	 * @return
	 */
	List<Project> selectUsersProjectWithAlarmCount(Project project);

	/**
	 * 查询所有项目
	 * 
	 * @return
	 */
	Map<String, List<Project>> selectAllProjects();
	
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
	
	/**
	 * 查项目下未处理告警信息条数
	 * @param projectId
	 * @return
	 */
	Project selectAlarmAlarmCount(Integer projectId);
	
	/**
	 * 查项目下采集器数量
	 * @param projectId
	 * @return
	 */
	Project selectTerminalsCount(Integer projectId);
	
	/**
	 * 查项目下离线采集器数量
	 * @param projectId
	 * @return
	 */
	Project selectAlarmTerminalsCount(Integer projectId);
}
