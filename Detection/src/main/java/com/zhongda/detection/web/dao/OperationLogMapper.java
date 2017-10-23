package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.OperationLog;

public interface OperationLogMapper {
    int deleteByPrimaryKey(Integer logId);

    int insert(OperationLog record);

    int insertSelective(OperationLog record);

    OperationLog selectByPrimaryKey(Integer logId);

    int updateByPrimaryKeySelective(OperationLog record);

    int updateByPrimaryKey(OperationLog record);
}