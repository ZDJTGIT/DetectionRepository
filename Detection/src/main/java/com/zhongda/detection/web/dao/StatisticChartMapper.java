package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.StatisticChart;

public interface StatisticChartMapper {
	int deleteByPrimaryKey(Integer statisticChartId);

	int insert(StatisticChart record);

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
}