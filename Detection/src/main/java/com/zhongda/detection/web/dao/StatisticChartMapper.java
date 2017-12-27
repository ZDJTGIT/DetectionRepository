package com.zhongda.detection.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhongda.detection.web.model.StatisticChart;

/**
 * 
 * <p>
 * </p>
 * 
 * @author 研发中心-LiIverson<1061734892@qq.com>
 * @sine 2017年11月29日
 */
public interface StatisticChartMapper {
	int deleteByPrimaryKey(Integer statisticChartId);

	int insert(StatisticChart record);
	/**
	 * 插入数据
	 * @param statisticChartId
	 * @return
	 * 
	 */
	int insertSelective(StatisticChart record);
	
	StatisticChart selectByPrimaryKey(Integer statisticChartId);

	int updateByPrimaryKeySelective(StatisticChart record);

	int updateByPrimaryKey(StatisticChart record);

	/**
	 * 通过项目ID查询数据
	 * 
	 * @param projectId
	 * @return
	 */
	List<StatisticChart> selectAllDataByProjectId(Integer projectId);

	/**
	 * 通过项目ID和检测类型Id查询数据
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	StatisticChart selectDataByProjectIdAndDetectionTId(
			@Param(value = "projectId") Integer projectId,
			@Param(value = "detectionTypeId") Integer detectionTypeId);
	
	
}