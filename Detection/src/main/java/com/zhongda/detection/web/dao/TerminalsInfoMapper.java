package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.TerminalsInfo;

public interface TerminalsInfoMapper {
	/**
	 * 根据采集器ID删除采集器
	 * @param terminalsInfoId
	 * @return
	 */
    int deleteByPrimaryKey(Integer terminalsInfoId);

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
    
    /**
     * 通过项目ID查项目下所有采集器
     * @param projectId
     * @return
     */
    List<TerminalsInfo> selectByProjectId(Integer projectId);

    int updateByPrimaryKey(TerminalsInfo record);
}