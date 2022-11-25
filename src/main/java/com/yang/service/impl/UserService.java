package com.yang.service.impl;

import com.yang.dao.UserDao;
import com.yang.domain.User;
import com.yang.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserService implements IUserService{

	@Qualifier("userDao")
	@Autowired
	private UserDao userDao;
	
	public User findUserByUserName(String username) throws Exception{
		return userDao.findUserByUserName(username);
	}
	
	public void addUser(User user) throws Exception{
		userDao.addUser(user);
	}

	@Override
	public String findUserNameByUserId(Integer user_id) throws Exception {
		// TODO Auto-generated method stub
		return userDao.findUserNameByUserId(user_id);
	}
}
