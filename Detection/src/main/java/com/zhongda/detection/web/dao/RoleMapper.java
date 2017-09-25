package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    /**
     * 根据用户id获取用户所拥有的角色
     * @param userId
     * @return
     */
	List<Role> selectRolesByUserId(Integer userId);
}