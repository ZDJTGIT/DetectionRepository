package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.RoleMapper;
import com.zhongda.detection.web.model.Role;
import com.zhongda.detection.web.service.RoleService;

/**
 *<p>角色Service实现类</p>
 * @author zmdeng
 * @date 2017年9月25日
 */
@Service
public class RoleServiceImpl implements RoleService{

	@Resource
	private RoleMapper roleMapper;

	@Override
	public List<Role> selectRolesByUserId(Integer userId) {
		return roleMapper.selectRolesByUserId(userId);
	}

}
