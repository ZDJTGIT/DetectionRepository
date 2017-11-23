package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.TerminalsInfo;

public interface TerminalsInfoMapper {
    int deleteByPrimaryKey(Integer terminalsInfoId);

    int insert(TerminalsInfo record);

    int insertSelective(TerminalsInfo record);

    TerminalsInfo selectByPrimaryKey(Integer terminalsInfoId);

    int updateByPrimaryKeySelective(TerminalsInfo record);

    int updateByPrimaryKey(TerminalsInfo record);
}