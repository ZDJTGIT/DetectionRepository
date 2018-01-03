package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.StatisticChart;

public interface StatisticChartService {

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
	StatisticChart selectDataByProjectIdAndDetectionTId(Integer projectId,
			Integer detectionTypeId);
	
	
	/**
	 * 给StatisticChart添加数据
	 */
	 int insertSelective(StatisticChart statisticChart);
	 
	 /**
	  * 根据ID更新StatisticChart数据
	  * 
	  */
	 int updateByPrimaryKeySelective(StatisticChart record);
}
