package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.DetectionPoint;

/**
 *<p>测点业务 接口</p>
 * @author mike
 * @date 2017年10月24日
 */
public interface DetectionPointService {
	
	 /**
     * 添加一个测点
     * @param record
     * @return
     */
    int insertSelective(DetectionPoint record);
    
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
    
    /**
     * 根据项目ID查该项目下所有测点
     * @param projectId
     * @return
     */
    List<DetectionPoint> selectByProjectId(Integer projectId);

    /**
     * 根据测点ID修改测点信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(DetectionPoint record);
}
