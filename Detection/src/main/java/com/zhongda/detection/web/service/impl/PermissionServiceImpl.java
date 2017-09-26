package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.PermissionMapper;
import com.zhongda.detection.web.model.Permission;
import com.zhongda.detection.web.service.PermissionService;

/**
 *<p>权限 业务 实现类</p>
 * @author zmdeng
 * @date 2017年9月25日
 */
@Service
public class PermissionServiceImpl implements PermissionService{

	@Resource
	private PermissionMapper permissionMapper;

	@Override
	public List<Permission> selectPermissionsByRoleId(Integer roleId) {
		return permissionMapper.selectPermissionsByRoleId(roleId);
	}

}
