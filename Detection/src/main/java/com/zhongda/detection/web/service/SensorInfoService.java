package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.Project;
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
    
    /**
     * 根据传感器编号查询传感器==>类型无作用暂时
     * @param sensorId
     * @return
     */
    SensorInfo selectBySensorIdAndSensorType(String sensorId, Integer projectId);
    
    /**
     * 根据项目ID查项目下所有传感器
     * @param ProjectId
     * @return
     */
    List<SensorInfo> selectByProjectId(Integer projectId);
    
    /**
	 * 根据查询条件查询出对应项目下传感器
	 * 
	 * @param project
	 *            封装了查询条件的对象
	 * @return
	 */
    List<SensorInfo> selectSensorInfoWithAlarmCount(Project project);
    
    /**
     * 根据传感器ID查唯一传感器
     * @return
     */
    SensorInfo selectSensorInfoBySensorInfoId(Integer sensorInfoId);
    
    SensorInfo  selectVirtualPk(String smu_id,String smu_cms_channel,String sensorId_addSensorInfo);
}
