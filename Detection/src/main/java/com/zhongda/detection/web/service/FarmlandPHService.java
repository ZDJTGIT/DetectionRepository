package com.zhongda.detection.web.service;

import com.google.common.collect.Multimap;
import com.zhongda.detection.web.model.FarmlandPH;

/**
 *<p>农田PH 业务 接口</p>
 * @author zmdeng
 * @date 2017年9月25日
 */
public interface FarmlandPHService {

	/**
	 * 通过项目id查询出对应项目下当前一天的所有测点的农田PH数据
	 * @param projectId
	 * @return
	 */
	Multimap<Integer, FarmlandPH> selectFarmlandPHByProjectIdAndToday(Integer projectId);

}
