package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.model.TerminalsInfo;
import com.zhongda.detection.web.service.TerminalsInfoService;

@Service
public class TerminalsInfoServiceImpl implements TerminalsInfoService {
	@Resource
	private TerminalsInfoService terminalsInfoService;
	
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
		// TODO Auto-generated method stub
		return 0;
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
	public List<TerminalsInfo> selectByProjectId(Integer projectId) {
		return terminalsInfoService.selectByProjectId(projectId);
	}

}
