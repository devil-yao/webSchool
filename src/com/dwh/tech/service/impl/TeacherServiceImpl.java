package com.dwh.tech.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dwh.tech.dao.TeacherDao;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;
import com.dwh.tech.entity.User;
import com.dwh.tech.service.TeacherService;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Resource
	private TeacherDao teacherDao;
	
	@Override
	public List<User> getAllTeacher() {
		// TODO Auto-generated method stub
		return teacherDao.getAllTeacher();
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return teacherDao.count();
	}

	@Override
	public PageResponse<User> getPage(PageRequest request) {
		// TODO Auto-generated method stub
		List<User> list = teacherDao.getAllTeacherPage(request);
		PageResponse<User> page  = new PageResponse<User>();
		page.setPageCount(request.getPageCount());
		page.setTotal(this.count());
		page.setList(list);
		return page;
	}

	@Override
	public List<User> getByCateId(PageRequest request, Integer cateId) {
		// TODO Auto-generated method stub
		return teacherDao.getByCateId(request, cateId);
	}

	@Override
	public int countByCateId(Integer cateId) {
		// TODO Auto-generated method stub
		return teacherDao.countByCateId(cateId);
	}

	@Override
	public List<User> getAllTeacherPage(PageRequest request) {
		// TODO Auto-generated method stub
		return teacherDao.getAllTeacherPage(request);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		teacherDao.update(user);
	}

	@Override
	public List<User> getTeacherPageByParam(PageRequest request, User user) {
		// TODO Auto-generated method stub
		return teacherDao.getTeacherPageByParam(request, user);
	}

	
	
}
