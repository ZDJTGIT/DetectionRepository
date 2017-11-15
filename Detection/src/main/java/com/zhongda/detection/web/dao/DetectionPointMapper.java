package com.zhongda.detection.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhongda.detection.web.model.DetectionPoint;

public interface DetectionPointMapper {

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

	int insert(DetectionPoint record);

	/**
	 * 添加一个测点
	 * 
	 * @param record
	 * @return
	 */
	int insertSelective(DetectionPoint record);

	DetectionPoint selectByPrimaryKey(Integer detectionPointId);

	/**
	 * 根据测点ID修改测点信息
	 * 
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(DetectionPoint record);

	int updateByPrimaryKey(DetectionPoint record);

	/**
	 * 根据项目ID查该项目下所有测点
	 * 
	 * @param projectId
	 * @return
	 */
	List<DetectionPoint> selectByProjectId(Integer projectId);

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
	List<DetectionPoint> selectLaserDataByCurrentTimes(
			@Param(value = "projectId") Integer projectId,
			@Param(value = "detectionTypeId") Integer detectionTypeId,
			@Param(value = "currentTime") String currentTime);

	/**
	 * 查询每天最大值最小值传给K线图
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	List<DetectionPoint> selectKlineGraphData(
			@Param(value = "projectId") Integer projectId,
			@Param(value = "detectionTypeId") Integer detectionTypeId);

}