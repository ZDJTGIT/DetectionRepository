package com.zhongda.detection.web.service;

import java.util.List;

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

	/**
	 * 获取超过最小或最大阈值的PH数据对象
	 * @param minData 最小值
	 * @param maxData 最大值
	 * @return
	 */
	List<FarmlandPH> selectFarmlandPHWithExceedThreshold(float minData, float maxData);

}
