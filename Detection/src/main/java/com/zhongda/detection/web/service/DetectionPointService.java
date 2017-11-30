package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.model.Project;

/**
 * <p>
 * 测点业务 接口
 * </p>
 * 
 * @author mike
 * @date 2017年10月24日
 */
public interface DetectionPointService {

	/**
	 * 添加一个测点
	 * 
	 * @param record
	 * @return
	 */
	int insertSelective(DetectionPoint record);

	/**
	 * 根据测点ID删除测点
	 * 
	 * @param detectionPointId
	 * @return
	 */
	int deleteByPrimaryKey(Integer detectionPointId);

	/**
	 * 根据项目ID删除测点（删除项目下对应所有测点）
	 * 
	 * @param projectId
	 * @return
	 */
	int deleteByProjectId(Integer projectId);

	/**
	 * 根据项目ID查该项目下所有测点
	 * 
	 * @param projectId
	 * @return
	 */
	List<DetectionPoint> selectByProjectId(Integer projectId);

	/**
	 * 左导航栏项目具体类型分类
	 * 
	 * @param projectId
	 * @return
	 */
	List<DetectionPoint> selectItemNameByProjectgId(Integer projectId);

	/**
	 * 查询激光测距数据
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @param currentTime
	 * @return
	 */
	List<DetectionPoint> selectLaserDataByCurrentTimes(Integer projectId,
			Integer detectionTypeId, String currentTime);

	/**
	 * 查询激光测距所有数据
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @param begincurrentTime
	 * @param endcurrentTime
	 * @return
	 */
	List<DetectionPoint> selectAllLaserDataByCurrentTimes(Integer projectId,
			Integer detectionTypeId, String begincurrentTime,
			String endcurrentTime);

	/**
	 * 查询沉降数据
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @param currentTime
	 * @return
	 */
	List<DetectionPoint> selectStaticLevelByCurrentTimes(Integer projectId,
			Integer detectionTypeId, String currentTime);

	/**
	 * 根据测点ID修改测点信息
	 * 
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(DetectionPoint record);

	/**
	 * 根据项目ID和测点名称查出唯一的的测点
	 * 
	 * @param projectID
	 * @param DetectionPointName
	 * @return
	 */
	DetectionPoint selectByProjectIDAndDetectionName(Integer projectId,
			String detectionName);

	/**
	 * 模糊查询测点
	 * 
	 * @param projectName
	 * @param keyWord
	 * @return
	 */
	List<DetectionPoint> selectByProjectNameAndKeyWord(String projectName,
			String keyWord);

	/**
	 * 查询每天最大值最小值传给K线图
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	List<DetectionPoint> selectKlineGraphData(Integer projectId,
			Integer detectionTypeId);

	/**
	 * 根据查询条件查询出对应项目下测点
	 * 
	 * @param project
	 *            封装了查询条件的对象
	 * @return
	 */
	List<DetectionPoint> selectDetectionPointWithAlarmCount(Project project);

	/**
	 * 根据测点ID查唯一的测点
	 * 
	 * @param detectionPointId
	 * @return
	 */
	DetectionPoint selectDetectionByDetectionPointId(Integer detectionPointId);

	/**
	 * 查询数据根据动态表名
	 * 
	 * @param tableName
	 * @param projectId
	 * @param detectionTypeId
	 * @param begincurrentTime
	 * @param endcurrentTime
	 * @return
	 */
	List<DetectionPoint> selectDataByTabelName(String tableName,
			Integer projectId, Integer detectionTypeId,
			String begincurrentTime, String endcurrentTime);

	/**
	 * 查询所有数据根据动态表名
	 * 
	 * @param tableName
	 * @param projectId
	 * @param detectionTypeId
	 * @param begincurrentTime
	 * @param endcurrentTime
	 * @return
	 */
	List<DetectionPoint> selectAllDataByTabelName(String tableName,
			Integer projectId, Integer detectionTypeId);

	/**
	 * 查询数据根据动态表名项目ID检测类型ID
	 * 
	 * @param tableName
	 * @param projectId
	 * @param detectionTypeId
	 * @param begincurrentTime
	 * @param endcurrentTime
	 * @return
	 */
	List<DetectionPoint> selectDataByTNAndPIAndDTI(String tableName,
			Integer projectId, Integer detectionTypeId, String currentTime);
}
