package com.zhongda.detection.web.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.TerminalsInfoMapper;
import com.zhongda.detection.web.model.TerminalsInfo;
import com.zhongda.detection.web.service.TerminalsInfoService;

@Service
public class TerminalsInfoServiceImpl implements TerminalsInfoService {
	@Resource
	private TerminalsInfoMapper terminalsInfoMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer terminalsInfoId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(TerminalsInfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(TerminalsInfo record) {
		return terminalsInfoMapper.insertSelective(record);
	}

	@Override
	public TerminalsInfo selectByPrimaryKey(Integer terminalsInfoId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(TerminalsInfo record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(TerminalsInfo record) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public TerminalsInfo selectBySmuIdAndProjectId(String smuId,
			Integer projectId) {
		return terminalsInfoMapper.selectBySmuIdAndProjectId(smuId, projectId);
	}

	@Override
	public int deleteBySmuIdAndProjectId(String smuId, Integer projectId) {
		return terminalsInfoMapper.deleteBySmuIdAndProjectId(smuId, projectId);
	}

}
