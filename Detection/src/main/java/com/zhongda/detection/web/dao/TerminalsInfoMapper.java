package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.TerminalsInfo;

public interface TerminalsInfoMapper {
	/**
	 * 根据采集器ID删除采集器
	 * @param terminalsInfoId
	 * @return
	 */
    int deleteByPrimaryKey(Integer terminalsInfoId);
    
    /**
     * 根据采集器编号和项目ID删除表记录
     * @param smuId
     * @return
     */
    int deleteBySmuIdAndProjectId(String smuId,Integer projectId);
    
    int insert(TerminalsInfo record);

    /**
     * 插入一条采集器信息
     * @param record
     * @return
     */
    int insertSelective(TerminalsInfo record);

    /**
     * 通过采集器ID查找采集器
     * @param terminalsInfoId
     * @return
     */
    TerminalsInfo selectByPrimaryKey(Integer terminalsInfoId);

    /**
     * 通过采集器ID修改采集器
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(TerminalsInfo record);
    
    int updateByPrimaryKey(TerminalsInfo record);
    
    /**
     * 通过采集器编号和项目ID查采集器
     * @param smuId
     * @param projectId
     * @return
     */
    TerminalsInfo selectBySmuIdAndProjectId(String smuId,Integer projectId);
}