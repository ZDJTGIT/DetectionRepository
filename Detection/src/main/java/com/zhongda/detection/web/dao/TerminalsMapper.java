package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.Terminals;

public interface TerminalsMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Terminals record);

    int insertSelective(Terminals record);

    Terminals selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Terminals record);

    int updateByPrimaryKey(Terminals record);
    
    /**
     * 根据项目ID查询采集器
     * @param project
     * @return
     */
    List<Terminals> selectByProjectId(Project project);
    
    /**
     * 通过采集器编号查询采集器
     * @param smuId
     * @return
     */
    Terminals selectBySmuId(String smuId);
    
    /**
     * 通过采集器编号修改采集器采集间隔时间
     * @param sumId
     * @param timesInterval
     * @return
     */
    int updateTimesIntervalBySumId(Terminals terminals);
    
}