package com.yang.dao;

import com.yang.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("userDao")
public interface UserDao {

	@Select("select * from user where username=#{username}")
	public User findUserByUserName(String username) throws Exception;

	
	@Insert("insert into user(username,password,nickname,email) values(#{username},#{password},#{nickname},#{email})")
	public void addUser(User user) throws Exception;


	@Select("select username from user where id=#{user_id}")
	public String findUserNameByUserId(Integer user_id) throws Exception;
	
	
}
