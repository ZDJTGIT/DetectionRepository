package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.Terminals;

public interface TerminalsService {

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
}
