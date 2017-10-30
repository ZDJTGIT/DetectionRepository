package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.DetectionPoint;

public interface DetectionPointMapper {
	
	/**
	 * 根据测点ID删除测点
	 * @param detectionPointId
	 * @return
	 */
    int deleteByPrimaryKey(Integer detectionPointId);
    
    /**
     * 根据项目ID删除测点（删除项目下对应所有测点）
     * @param projectId
     * @return
     */
    int deleteByProjectId(Integer projectId);

    int insert(DetectionPoint record);

    /**
     * 添加一个测点
     * @param record
     * @return
     */
    int insertSelective(DetectionPoint record);

    DetectionPoint selectByPrimaryKey(Integer detectionPointId);

    /**
     * 根据测点ID修改测点信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(DetectionPoint record);

    int updateByPrimaryKey(DetectionPoint record);
    
    /**
     * 根据项目ID查该项目下所有测点
     * @param projectId
     * @return
     */
    List<DetectionPoint> selectByProjectId(Integer projectId);
}