package com.dwh.tech.service;

import java.util.List;

import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;
import com.dwh.tech.entity.User;

public interface TeacherService {

	List<User> getAllTeacher();
	
	int count();
	
	int countByCateId(Integer cateId);
	
	PageResponse<User> getPage(PageRequest request);
	
	List<User> getByCateId(PageRequest request,Integer cateId);
	
	List<User> getAllTeacherPage(PageRequest request);
	
	void update(User user);
	
	List<User> getTeacherPageByParam(PageRequest request,User user);
	
}
