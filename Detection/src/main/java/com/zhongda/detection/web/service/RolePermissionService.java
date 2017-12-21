package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.Result;
import com.zhongda.detection.web.model.RolePermission;

/**
 *<p>角色权限关联关系  业务 接口</p>
 * @author zmdeng
 * @date 2017年12月20日
 */
public interface RolePermissionService {
	
	/**
	 * 批量插入角色与权限关联关系(删除原有权限，添加新的权限)
	 * @param rolePermissionList
	 * @return
	 */
	Result<RolePermission> insertMoreRolePermission(List<RolePermission> rolePermissionList);

}
