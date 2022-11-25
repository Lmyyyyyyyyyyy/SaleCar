package com.yang.service;

import com.yang.domain.User;

public interface IUserService {
	
	public User findUserByUserName(String username) throws Exception;

	public void addUser(User user) throws Exception;

	public String findUserNameByUserId(Integer user_id) throws Exception;
}
