package com.zhongda.detection.web.service.impl;

import javax.annotation.Resource;

import com.zhongda.detection.web.dao.DetectionPointMapper;
import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.service.DetectionPointService;

/**
 * <p> 测点业务实现类 </p>
 * @author mike
 * @data 2017/10/25
 */
public class DetectionPointServiceImpl implements DetectionPointService {

	@Resource
	private DetectionPointMapper detectionPointMapper;
	
	@Override
	public int insertSelective(DetectionPoint record) {
		return detectionPointMapper.insertSelective(record);
	}

}
