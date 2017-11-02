package com.zhongda.detection.web.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.zhongda.detection.web.dao.ImageMapper;
import com.zhongda.detection.web.model.Image;
import com.zhongda.detection.web.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService {
	

	@Resource
	private ImageMapper imageMapper;

	@Override
	public Image selectImageByTwoId(Integer projectId, Integer detectionTypeId) {
		return imageMapper.selectImageByTwoId(projectId, detectionTypeId);
	}

	public List<Image> selectByProjectId(Integer projectId) {
		return imageMapper.selectByProjectId(projectId);
	}

	@Override
	public int insertSelective(Image record) {
		return imageMapper.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(Image record) {
		return imageMapper.updateByPrimaryKeySelective(record);
	}


}
