package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.Permission;

public interface PermissionMapper {
    int deleteByPrimaryKey(Integer permissionId);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer permissionId);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);

    /**
     * 根据角色id获取角色所拥有的权限
     * @param roleId
     * @return
     */
	List<Permission> selectPermissionsByRoleId(Integer roleId);
}