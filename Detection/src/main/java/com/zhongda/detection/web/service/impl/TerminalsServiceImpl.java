package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.zhongda.detection.web.dao.TerminalsMapper;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.Terminals;
import com.zhongda.detection.web.service.TerminalsService;

@Service
public class TerminalsServiceImpl implements TerminalsService {

	@Resource
	private TerminalsMapper terminalsMapper;
	
	@Override
	public List<Terminals> selectByProjectId(Project project) {
		if (null != project.getPageNum() && null != project.getPageSize()) {
			PageHelper.startPage(project.getPageNum(), project.getPageSize());
		}
		return terminalsMapper.selectByProjectId(project);
	}

	@Override
	public Terminals selectBySmuId(String smuId) {
		return terminalsMapper.selectBySmuId(smuId);
	}

	@Override
	public int updateTimesIntervalBySumId(Terminals terminals) {
		return terminalsMapper.updateTimesIntervalBySumId(terminals);
	}
}
