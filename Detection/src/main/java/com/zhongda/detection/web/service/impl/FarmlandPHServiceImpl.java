package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import com.zhongda.detection.web.dao.FarmlandPHMapper;
import com.zhongda.detection.web.model.FarmlandPH;
import com.zhongda.detection.web.service.FarmlandPHService;

/**
 *<p>农田PH 业务 实现类</p>
 * @author zmdeng
 * @date 2017年9月25日
 */
@Service
public class FarmlandPHServiceImpl implements FarmlandPHService{

	@Resource
	private FarmlandPHMapper farmlandPHMapper;

	@Override
	public Multimap<Integer, FarmlandPH> selectFarmlandPHByProjectIdAndToday(Integer projectId) {
		Multimap<Integer, FarmlandPH> multimap = ArrayListMultimap.create();
		List<FarmlandPH> farmlandPHList = farmlandPHMapper.selectFarmlandPHByProjectIdAndToday(projectId);
		for (FarmlandPH farmlandPH : farmlandPHList) {
			multimap.put(farmlandPH.getDetectionId(), farmlandPH);
		}
		return multimap;
	}

	@Override
	public List<FarmlandPH> selectFarmlandPHWithExceedThreshold(float minData,
			float maxData) {
		return farmlandPHMapper.selectFarmlandPHWithExceedThreshold(minData, maxData);
	}

}
