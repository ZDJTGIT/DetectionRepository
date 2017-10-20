package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.UserMapper;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.service.UserService;

/**
 * 用户Service实现类
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

	@Override
	public boolean insertUser(User user) {
		String cryptedPwd = new Md5Hash(user.getPassword(),user.getUserName(),1024).toString();
		System.out.println("register cryptedPwd:"+cryptedPwd);
		user.setPassword(cryptedPwd);
		int index = userMapper.insert(user);
		if(index>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<User> selectList(Integer userId) {
		return userMapper.selectAllUser(userId);
	}

	@Override
	public User authentication(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> selectAllByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkusername(String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkEmail(String email) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void changePassword(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public User selectByUsername(String username) {
		return userMapper.selectByUsername(username);
	}

	@Override
	public boolean deleteUser(String name) {
		return userMapper.deleteUser(name);
	}


	@Override
	public int updateByPrimaryKeySelective(User record) {
		return userMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public User selectByPrimaryKey(Integer userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

	@Override
	public User selectByEmail(String email) {
		return userMapper.selectByEmail(email);
	}

	@Override
	public User selectByPhone(String phone) {
		return userMapper.selectByPhone(phone);
	}

	@Override
	public List<User> selectUserByKeyword(String keyword,Integer userId) {
		return userMapper.selectUserByKeyword(keyword,userId);
	}

	@Override
	public int insertUser_Role(Integer userId, Integer roleId) {
		return userMapper.insertUser_Role(userId, roleId);
	}

	@Override
	public boolean deleteUser_role(Integer userId) {
		return userMapper.deleteUser_role(userId);
	}

	@Override
	public int updateUsersRole(User user) {
		return userMapper.updateUsersRole(user);
	}

	@Override
	public List<User> selectUserWithoutAdmin() {
		return userMapper.selectUserWithoutAdmin();
	}

}