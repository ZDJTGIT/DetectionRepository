package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.SensorInfo;


/**
 *<p>传感器业务 接口</p>
 * @author mike
 * @date 2017年10月24日
 */
public interface SensorInfoService {
	
	/**
	 * 根据传感器ID删除传感器
	 * @param sensorInfoId
	 * @return
	 */
    int deleteByPrimaryKey(Integer sensorInfoId);
    
    /**
     * 根据项目ID删除传感器（删除项目下所有测点下对应所有传感器）
     * @param detectionPointId
     * @return
     */
    int deleteByProjectId(Integer project);
    
    /**
     * 根据测点ID查测点下所有传感器
     * @param DetectionId
     * @return
     */
    List<SensorInfo> selectByDetectionPointId(Integer detectionPointId);
    
    /**
     * 根据测点ID删除测点下所有传感器
     * @param detectionPointId
     * @return
     */
    int deleteByDetectionPointId(Integer detectionPointId);
    
    /**
     * 插入一条传感器记录
     * @param record
     * @return
     */
    int insertSelective(SensorInfo record);
    
    /**
     * 根据传感器ID修改传感器信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(SensorInfo record);

}
