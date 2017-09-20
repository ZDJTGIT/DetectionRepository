package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	User selectByUsername(String userName);

	boolean addUser(User user);

	boolean deleteUser(String name);

	/**
	 * 查询所有的用户
	 * @return
	 */
	List<User> selectAllUser();
}