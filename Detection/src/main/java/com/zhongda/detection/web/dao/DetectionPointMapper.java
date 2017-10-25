package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.DetectionPoint;

public interface DetectionPointMapper {
    int deleteByPrimaryKey(Integer detectionPointId);

    int insert(DetectionPoint record);

    /**
     * 添加一个测点
     * @param record
     * @return
     */
    int insertSelective(DetectionPoint record);

    DetectionPoint selectByPrimaryKey(Integer detectionPointId);

    int updateByPrimaryKeySelective(DetectionPoint record);

    int updateByPrimaryKey(DetectionPoint record);
}