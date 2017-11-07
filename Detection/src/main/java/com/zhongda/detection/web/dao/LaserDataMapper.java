package com.zhongda.detection.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhongda.detection.web.model.LaserData;

public interface LaserDataMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(LaserData record);

	int insertSelective(LaserData record);

	LaserData selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(LaserData record);

	int updateByPrimaryKey(LaserData record);

	/**
	 * 通过传感器ID和时间查询数据
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @return
	 */
	List<LaserData> selectAllDataBySensorIdAndTime(
			@Param(value = "sensorId") String sensorId,
			@Param(value = "currentTime") String currentTime);
}