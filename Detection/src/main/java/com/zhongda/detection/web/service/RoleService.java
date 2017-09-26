package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.Role;

/**
 *<p>角色 业务 接口</p>
 * @author zmdeng
 * @date 2017年9月25日
 */
public interface RoleService {

	/**
	 * 根据用户id获取用户所拥有的角色
	 * @param userId
	 * @return
	 */
	List<Role> selectRolesByUserId(Integer userId);

}
