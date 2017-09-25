package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.Permission;

/**
 *<p>权限 业务 接口</p>
 * @author zmdeng
 * @date 2017年9月25日
 */
public interface PermissionService {

	/**
	 * 根据角色id获取角色所拥有的权限
	 * @param roleId
	 * @return
	 */
	List<Permission> selectPermissionsByRoleId(Integer roleId);

}
