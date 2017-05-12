package com.dwh.tech.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dwh.tech.dao.UserDao;
import com.dwh.tech.entity.User;
import com.dwh.tech.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;
	
	@Override
	public User getUser(String loginName,String password) {
		String regex = "^1[3578]\\d{9}$";
		if(loginName.matches(regex)){
			return userDao.getUser(null,loginName, password);
		}else{
			return userDao.getUser(loginName,null, password);
		}
		
		
	}
	
	@Override
	public Boolean check(String phone, String loginName) {
		int flag = userDao.check(phone, loginName);
		return flag>0;
	}

	@Override
	public Boolean insert(User user) {
		int flag = userDao.insert(user);
		return flag > 0;
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public void updatePwd(int id, String password) {
		userDao.updatePwd(id, password);
	}

	@Override
	public User getById(Integer userId) {
		// TODO Auto-generated method stub
		return userDao.getById(userId);
	}

	@Override
	public User getTech(Integer userId) {
		// TODO Auto-generated method stub
		return userDao.getTech(userId);
	}

	@Override
	public List<User> getByParam(User user) {
		// TODO Auto-generated method stub
		return userDao.getByParam(user);
	}

	@Override
	public int updateStatus(Integer userId, Integer status) {
		// TODO Auto-generated method stub
		return userDao.updateStatus(userId, status);
	}

}
