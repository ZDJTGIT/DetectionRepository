package com.zhongda.detection.web.dao;


import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.zhongda.detection.web.model.Image;

public interface ImageMapper {
	int deleteByPrimaryKey(Integer imageId);
	
	/**
	 * 通过项目ID删除项目下所有图片
	 * @param projectId
	 * @return
	 */
	int deleteByProjectId(Integer projectId);

	int insert(Image record);

	int updateByPrimaryKey(Image record);

    /**
     * 插入一条图片地址数据
     * @param record
     * @return
     */
    int insertSelective(Image record);

    Image selectByPrimaryKey(Integer imageId);
    
    /**
     * 查项目下所有图片信息(包括测点类型名称字段一并查出)
     * @param projectId
     * @return
     */
    List<Image> selectImageByProjectId(Integer projectId);

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
	Image selectImageByTwoId(@Param(value = "projectId") Integer projectId,
			@Param(value = "detectionTypeId") Integer detectionTypeId);

}