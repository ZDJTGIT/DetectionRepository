package com.zhongda.detection.web.service;

import java.util.List;
import java.util.Map;

import com.zhongda.detection.web.model.FarmlandPoint;

public interface FarmlandPointService {

	/**
	 * 查询所有农田测点数据通过农田Id，根据测点ID处理成Map类型
	 * 
	 * @return
	 */
	Map<String, List<FarmlandPoint>> selectByFarmlandID(Integer farmlandId);
}
