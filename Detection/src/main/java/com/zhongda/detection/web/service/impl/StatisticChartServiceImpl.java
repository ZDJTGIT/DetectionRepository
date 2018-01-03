package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.StatisticChartMapper;
import com.zhongda.detection.web.model.StatisticChart;
import com.zhongda.detection.web.service.StatisticChartService;

@Service
public class StatisticChartServiceImpl implements StatisticChartService {

	@Resource
	private StatisticChartMapper statisticChartMapper;

	@Override
	public List<StatisticChart> selectAllDataByProjectId(Integer projectId) {
		return statisticChartMapper.selectAllDataByProjectId(projectId);
	}

	@Override
	public StatisticChart selectDataByProjectIdAndDetectionTId(
			Integer projectId, Integer detectionTypeId) {
		return statisticChartMapper.selectDataByProjectIdAndDetectionTId(
				projectId, detectionTypeId);
	}

	@Override
	public int insertSelective(StatisticChart statisticChart) {
		
		return statisticChartMapper.insertSelective(statisticChart);
	}

	@Override
	public int updateByPrimaryKeySelective(StatisticChart record) {
		int lins = statisticChartMapper.updateByPrimaryKeySelective(record);
		return lins;
	}

}
