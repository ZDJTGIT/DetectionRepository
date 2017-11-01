package com.zhongda.detection.web.dao;

import org.apache.ibatis.annotations.Param;

import com.zhongda.detection.web.model.Image;

public interface ImageMapper {
	int deleteByPrimaryKey(Integer imageId);

	int insert(Image record);

	int insertSelective(Image record);

	Image selectByPrimaryKey(Integer imageId);

	int updateByPrimaryKeySelective(Image record);

	int updateByPrimaryKey(Image record);

	/**
	 * 查找图片根据项目ID和项目类型ID
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	Image selectImageByTwoId(@Param(value = "projectId") Integer projectId,
			@Param(value = "detectionTypeId") Integer detectionTypeId);
}