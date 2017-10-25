package com.zhongda.detection.web.service;

import com.zhongda.detection.web.model.DetectionPoint;

/**
 *<p>测点业务 接口</p>
 * @author mike
 * @date 2017年10月24日
 */
public interface DetectionPointService {
	
	 /**
     * 添加一个测点
     * @param record
     * @return
     */
    int insertSelective(DetectionPoint record);

}
