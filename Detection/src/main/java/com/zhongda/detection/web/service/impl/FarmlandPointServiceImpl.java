package com.zhongda.detection.web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.FarmlandPointMapper;
import com.zhongda.detection.web.model.FarmlandPoint;
import com.zhongda.detection.web.service.FarmlandPointService;

@Service
public class FarmlandPointServiceImpl implements FarmlandPointService {

	@Resource
	private FarmlandPointMapper farmPoinMapper;

	@Override
	public Map<String, List<FarmlandPoint>> selectByFarmlandID(
			Integer farmlandId) {
		List<FarmlandPoint> farmPointList = farmPoinMapper
				.selectByFarmlandID(farmlandId);
		System.out.println("---------------farmPointList:" + farmPointList);

		Map<String, List<FarmlandPoint>> farmPointMap = new HashMap<String, List<FarmlandPoint>>();
		for (FarmlandPoint farmlandPoint : farmPointList) {
			String key = "测点" + farmlandPoint.getFarmlandId();
			List<FarmlandPoint> value = farmPointMap.get(key);
			if (null == value) {
				value = new ArrayList<FarmlandPoint>();
			}
			value.add(farmlandPoint);
			farmPointMap.put(key, value);
		}

		return farmPointMap;
	}

}
