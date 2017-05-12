package com.dwh.tech.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.User;

public interface TeacherDao {

	public List<User> getAllTeacher();
	
	int count();
	
	int countByCateId(@Param("cateId")Integer cateId);
	
	List<User> getAllTeacherPage(@Param("request")PageRequest request);
	
	List<User> getByCateId(@Param("request")PageRequest request,@Param("cateId")Integer cateId);

	void update(@Param("user")User user);
	
	List<User> getTeacherPageByParam(@Param("request")PageRequest request,@Param("user")User user);
	
}
