package com.zhongda.detection.web.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.ImageMapper;
import com.zhongda.detection.web.model.Image;
import com.zhongda.detection.web.service.ImageService;

/**
 * 
 * <p>
 * </p>
 * 
 * @author 研发中心-LiIverson<1061734892@qq.com>
 * @sine 2017年11月1日
 */
@Service
public class ImageServiceImpl implements ImageService {

	@Resource
	private ImageMapper imageMapper;

	@Override
	public Image selectImageByTwoId(Integer projectId, Integer detectionTypeId) {
		return imageMapper.selectImageByTwoId(projectId, detectionTypeId);
	}

}
