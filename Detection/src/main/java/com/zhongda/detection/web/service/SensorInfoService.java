package com.zhongda.detection.web.service;

import java.util.List;
import java.util.Map;

import com.zhongda.detection.web.model.SensorInfo;

/**
 * <p>
 * 传感器 业务 接口
 * </p>
 * 
 * @author zmdeng
 * @date 2017年9月25日
 */
public interface SensorInfoService {

	/**
	 * 通过项目id来查询对应的所有传感器信息
	 * 
	 * @param projectId
	 * @return
	 */
	List<SensorInfo> selectSensorTypeByProjectId(Integer projectId);

	/**
	 * 查询所有传感器和字典表通过项目ID
	 * 
	 * @param projectId
	 * @return
	 */
	Map<String, List<SensorInfo>> selectsenInfoAndSysdicByProjectId(
			Integer projectId);

}
