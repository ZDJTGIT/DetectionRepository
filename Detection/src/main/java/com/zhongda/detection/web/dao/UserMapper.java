package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	User selectByUsername(String userName);

	boolean addUser(User user);

	boolean deleteUser(String name);
	
	User selectByEmail(String email);
	
	User selectByPhone(String phone);
	/**
	 * 查询所有的用户
	 * @return
	 */
	List<User> selectAllUser(Integer userId);
	/**
	 * 根据关键字模糊查询所有字段符合关键字的用户
	 * @return
	 */
	List<User> selectUserByKeyword(String keyword ,Integer userId);
	/**
	 * 添加用户时在权限表为用户添加一条权限信息
	 * @return
	 */
	int insertUser_Role(Integer userId, Integer roleId);
	/**
	 * 删除用户对应的权限表中数据
	 * @return
	 */
	boolean deleteUser_role(Integer userId);
	/**
	 * 修改用户权限表中用户的权限
	 * @return
	 */
	int updateUsersRole(User user);
}