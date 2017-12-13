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
	 * @param userId
	 * @return
	 */
	List<User> selectAllUser(Integer userId);

	/**
	 * 根据关键字模糊查询所有字段符合关键字的用户
	 * @param keyword
	 * @param userId
	 * @return
	 */
	List<User> selectUserByKeyword(String keyword, Integer userId);

	/**
	 * 添加用户时在权限表为用户添加一条权限信息
	 * @param userId
	 * @param roleId
	 * @return
	 */
	int insertUser_Role(Integer userId, Integer roleId);

	/**
	 * 删除用户对应的权限表中数据
	 * @param userId
	 * @return
	 */
	boolean deleteUser_role(Integer userId);

	/**
	 * 修改用户权限表中用户的权限
	 * @param user
	 * @return
	 */
	int updateUsersRole(User user);

	/**
	 * 查找除管理员和非管理员的所有用户
	 * @return
	 */
	List<User> selectUserWithoutAdmin();

	/**
	 * 返回权限Id
	 * @param userId
	 * @return
	 */
	int selectUserRoleByUserId(Integer userId);
	
	/**
	 * 根据用户名和ID查用户
	 * @param username
	 * @param userId
	 * @return
	 */
	User selectByPrimaryKeyAndUserName(String userName, Integer userId);
}