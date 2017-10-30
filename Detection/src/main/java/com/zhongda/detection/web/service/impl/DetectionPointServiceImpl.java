package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.DetectionPointMapper;
import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.service.DetectionPointService;

/**
 * <p> 测点业务实现类 </p>
 * @author mike
 * @data 2017/10/25
 */
@Service
public class DetectionPointServiceImpl implements DetectionPointService {

	@Resource
	private DetectionPointMapper detectionPointMapper;
	
	@Override
	public int insertSelective(DetectionPoint record) {
		return detectionPointMapper.insertSelective(record);
	}

	@Override
	public int deleteByPrimaryKey(Integer detectionPointId) {
		return detectionPointMapper.deleteByPrimaryKey(detectionPointId);
	}

	@Override
	public int deleteByProjectId(Integer projectId) {
		return detectionPointMapper.deleteByProjectId(projectId);
	}

	@Override
	public List<DetectionPoint> selectByProjectId(Integer projectId) {
		return detectionPointMapper.selectByProjectId(projectId);
	}

	@Override
	public int updateByPrimaryKeySelective(DetectionPoint record) {
		return detectionPointMapper.updateByPrimaryKeySelective(record);
	}

}
