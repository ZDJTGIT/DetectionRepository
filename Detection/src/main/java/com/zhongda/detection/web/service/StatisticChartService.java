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
}