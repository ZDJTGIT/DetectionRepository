package com.zhongda.detection.web.service.impl;

import javax.annotation.Resource;

import com.zhongda.detection.web.dao.ThresholdMapper;
import com.zhongda.detection.web.model.Threshold;
import com.zhongda.detection.web.service.ThresholdService;

/**
 *<p>Threshold 业务 实现类</p>
 * @author mike
 * @date 2017年9月27日
 */
public class ThresholdServiceImpl implements ThresholdService {
	
	@Resource
	private ThresholdMapper thresholdMapper;

	@Override
	public int insertSelective(Threshold record) {
		return thresholdMapper.insertSelective(record);
	}

}
