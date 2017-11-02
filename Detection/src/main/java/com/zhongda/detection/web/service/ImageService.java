package com.zhongda.detection.web.service;

import com.zhongda.detection.web.model.Image;
import java.util.List;

public interface ImageService {

	 /**
     * 查项目下所有图片信息
     * @param projectId
     * @return
     */
    List<Image> selectByProjectId(Integer projectId);
	
    /**
     * 插入一条图片地址数据
     * @param record
     * @return
     */
    int insertSelective(Image record);

    /**
     * 根据ID修改图片信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Image record);

	/**
	 * 查找图片根据项目ID和项目类型ID
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	Image selectImageByTwoId(Integer projectId, Integer detectionTypeId);

}
