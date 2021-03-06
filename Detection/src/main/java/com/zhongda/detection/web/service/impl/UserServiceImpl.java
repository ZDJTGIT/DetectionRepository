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
		String cryptedPwd = new Md5Hash(user.getPassword(),user.getName(),1024).toString();
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
	public List<User> selectList() {
		// TODO Auto-generated method stub
		return null;
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

}