package com.dwh.tech.service;

import java.util.List;

import com.dwh.tech.entity.User;

public interface UserService {

	User getUser(String loginName,String password); 
	
	Boolean insert(User user);
	
	Boolean check(String phone,String loginName);
	
	void update(User user);
	
	void updatePwd(int id,String password);
	
	User getById(Integer userId);
	
	User getTech(Integer userId);
	
	List<User> getByParam(User user);
	
	int updateStatus(Integer userId,Integer status);
}
