package com.dwh.tech.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dwh.tech.entity.User;

public interface UserDao {

	User getUser(@Param("loginName") String loginName,@Param("phone") String phone,@Param("password") String password); 
	
	int insert(@Param("user") User user);
	
	int check(@Param("phone")String phone,@Param("loginName") String loginName);
	
	void update(@Param("user") User user);

	void updatePwd(@Param("id") int id,@Param("password") String password);
	
	User getById(@Param("userId") Integer userId);
	
	User getTech(@Param("userId") Integer userId);
	
	List<User> getByParam(@Param("user") User user);
	
	int updateStatus(@Param("id")Integer userId,@Param("status")Integer status);
}
