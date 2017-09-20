package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.FarmlandPoint;

public interface FarmlandPointMapper {
	int deleteByPrimaryKey(Integer timeId);

	int insert(FarmlandPoint record);

	int insertSelective(FarmlandPoint record);

	FarmlandPoint selectByPrimaryKey(Integer timeId);

	int updateByPrimaryKeySelective(FarmlandPoint record);

	int updateByPrimaryKey(FarmlandPoint record);

	/**
	 * 查询所有数据通过农田ID
	 * 
	 * @param farmlandId
	 * @return
	 */
	List<FarmlandPoint> selectByFarmlandID(Integer farmlandId);
}