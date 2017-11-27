package com.zhongda.detection.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zhongda.detection.web.model.StaticLevelData;

public interface StaticLevelDataMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(StaticLevelData record);

	int insertSelective(StaticLevelData record);

	StaticLevelData selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(StaticLevelData record);

	int updateByPrimaryKey(StaticLevelData record);

	/**
	 * 通过传感器ID和时间查询数据
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @return
	 */
	List<StaticLevelData> selectAllDataBySensorIdAndTime(
			@Param(value = "sensorId") String sensorId,
			@Param(value = "currentTime") String currentTime);
}