package com.zhongda.detection.web.service;

import com.zhongda.detection.web.model.Image;

public interface ImageService {

	/**
	 * 查找图片根据项目ID和项目类型ID
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	Image selectImageByTwoId(Integer projectId, Integer detectionTypeId);

}
