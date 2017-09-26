package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.FarmlandPH;

public interface FarmlandPHMapper {
    int deleteByPrimaryKey(Integer phId);

    int insert(FarmlandPH record);

    int insertSelective(FarmlandPH record);

    FarmlandPH selectByPrimaryKey(Integer phId);

    int updateByPrimaryKeySelective(FarmlandPH record);

    int updateByPrimaryKey(FarmlandPH record);

    /**
     * 通过项目id查询出对应项目下当前一天的所有测点的农田PH数据
     * @param projectId
     * @return
     */
	List<FarmlandPH> selectFarmlandPHByProjectIdAndToday(Integer projectId);
}