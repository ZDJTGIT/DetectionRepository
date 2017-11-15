package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.zhongda.detection.web.dao.DetectionPointMapper;
import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.service.DetectionPointService;

/**
 * <p>
 * 测点业务实现类
 * </p>
 * 
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

	@Override
	public DetectionPoint selectByProjectIDAndDetectionName(Integer projectId,
			String detectionName) {
		return detectionPointMapper.selectByProjectIDAndDetectionName(
				projectId, detectionName);
	}

	@Override
	public List<DetectionPoint> selectByProjectNameAndKeyWord(
			String projectName, String keyWord) {
		return detectionPointMapper.selectByProjectNameAndKeyWord(projectName,
				keyWord);
	}

	@Override
	public List<DetectionPoint> selectItemNameByProjectgId(Integer projectId) {
		return detectionPointMapper.selectItemNameByProjectgId(projectId);
	}

	@Override
	public List<DetectionPoint> selectLaserDataByCurrentTimes(
			Integer projectId, Integer detectionTypeId, String currentTime) {
		return detectionPointMapper.selectLaserDataByCurrentTimes(projectId,
				detectionTypeId, currentTime);
	}

	@Override
	public List<DetectionPoint> selectKlineGraphData(Integer projectId,
			Integer detectionTypeId) {
		return detectionPointMapper.selectKlineGraphData(projectId,
				detectionTypeId);
	}

	public List<DetectionPoint> selectDetectionPointWithAlarmCount(Project project) {
		if (null != project.getPageNum() && null != project.getPageSize()) {
			PageHelper.startPage(project.getPageNum(), project.getPageSize());
		}
		return detectionPointMapper.selectDetectionPointWithAlarmCount(project);
	}
}
