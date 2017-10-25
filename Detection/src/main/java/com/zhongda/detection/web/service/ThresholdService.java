package com.zhongda.detection.web.service;

import com.zhongda.detection.web.model.Threshold;

/**
 * <p>Threshold业务 接口</p>
 * @author mike
 * @date 2017年10月24日
 */
public interface ThresholdService {
	
	 /**
     * insert a Threshold
     * @param record
     * @return
     */
    int insertSelective(Threshold record);

}
