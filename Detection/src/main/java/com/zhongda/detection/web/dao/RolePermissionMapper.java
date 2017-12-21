package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.RolePermission;

public interface RolePermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RolePermission record);

    int insertSelective(RolePermission record);

    RolePermission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RolePermission record);

    int updateByPrimaryKey(RolePermission record);
    
    /**
     * 批量插入角色权限关联关系
     * @param rolePermissionList
     * @return
     */
    int insertMoreRolePermission(List<RolePermission> rolePermissionList);
    
    /**
     * 删除当前角色下所有的关联的权限
     * @param roleId
     * @return
     */
	int deleteRolePermissionByRoleId(Integer roleId);
}