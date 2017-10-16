package com.zhongda.detection.web.service;

import java.util.List;

import com.zhongda.detection.web.model.User;

/**
 *<p>用户 业务 接口</p>
 * @author zmdeng
 * @date 2017年9月25日
 */
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
	List<User> selectList(Integer userId);

	/**
	 * 修改用户信息
	 */
	int updateByPrimaryKeySelective(User record);

	/**
	 * 根据用户名删除用户
	 */
	boolean deleteUser(String name);

	/**
	 * 根据Id查用户
	 */
	User selectByPrimaryKey(Integer userId);
	
	/**
	 * 根据邮箱号查用户
	 */
	User selectByEmail(String email);
	
	/**
	 * 根据手机号码查用户
	 */
	User selectByPhone(String phone);
	
	/**
	 * 根据关键字模糊查询所有字段符合关键字的用户
	 * @return
	 */
	List<User> selectUserByKeyword(String keyword, Integer userId);
	
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
