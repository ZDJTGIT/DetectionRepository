package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.User;

/**
 * 用户 业务 接口
 **/
public interface UserService {

    /**
     * 用户登录验证
     * @param user
     * @return
     */
    User authentication(User user);

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    User selectByUsername(String username);

    /**
     * 根据用户名模糊查询用户
     * @param username
     * @return
     */
    List<User> selectAllByUsername(String username);

    /**
     * 用户注册
     * @param user
     * @return true代表插入成功 ;false代表插入失败
     */
    boolean insertUser(User user);

    /**
     * 检查用户是否存在
     * @param username
     */
	boolean checkusername(String username);

	/**
     * 检查邮箱是否存在
     * @param username
     */
	boolean checkEmail(String email);

	/**
	 * 根据邮箱来修改密码
	 * @param user
	 */
	void changePassword(User user);

	/**
	 * 查询所有用户
	 * @return
	 */
	List<User> selectList();
	
	/*
	 * 修改用户信息
	 */
	int updateByPrimaryKeySelective(User record);
	
	/*
	 * 根据用户名删除用户
	 */
	boolean deleteUser(String name);
	
	/*
	 * 根据Id查用户
	 */
	User selectByPrimaryKey(Integer userId);
}
