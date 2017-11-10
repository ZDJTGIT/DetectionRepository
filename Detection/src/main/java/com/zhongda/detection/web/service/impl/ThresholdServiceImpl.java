package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.ThresholdMapper;
import com.zhongda.detection.web.model.Threshold;
import com.zhongda.detection.web.service.ThresholdService;

/**
 * <p>
 * Threshold 业务 实现类
 * </p>
 * 
 * @author mike
 * @date 2017年9月27日
 */
@Service
public class ThresholdServiceImpl implements ThresholdService {

	@Resource
	private ThresholdMapper thresholdMapper;

	@Override
	public int insertSelective(Threshold record) {
		return thresholdMapper.insertSelective(record);
	}

	@Override
	public int deleteByPrimaryKey(Integer thresholdId) {
		return thresholdMapper.deleteByPrimaryKey(thresholdId);
	}

	@Override
	public int deleteByProjectId(Integer projectId) {
		return thresholdMapper.deleteByProjectId(projectId);
	}

	@Override
	public List<Threshold> selectByProjectId(Integer projectId) {
		return thresholdMapper.selectByProjectId(projectId);
	}

	@Override
	public int updateByPrimaryKeySelective(Threshold record) {
		return thresholdMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<Threshold> selectByProjectIdAndDetectionTypeId(Integer projectId,
			Integer detectionTypeId) {
		return thresholdMapper.selectByProjectIdAndDetectionTypeId(projectId,
				detectionTypeId);
	}

	@Override
	public Threshold selectThresholdByProjectIdDetectionTypeIdThresholdTypeId(
			Integer projectId, Integer detectionTypeId, Integer thresholdTypeId) {
		return thresholdMapper
				.selectThresholdByProjectIdDetectionTypeIdThresholdTypeId(
						projectId, detectionTypeId, thresholdTypeId);
	}

}
