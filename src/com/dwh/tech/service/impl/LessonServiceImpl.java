package com.dwh.tech.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dwh.tech.dao.LessonDao;
import com.dwh.tech.entity.Lesson;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;
import com.dwh.tech.service.LessonService;

@Service
public class LessonServiceImpl implements LessonService {

	@Resource
	private LessonDao lessonDao;
	
	@Override
	public PageResponse<Lesson> getPage(PageRequest request) {
		List<Lesson> list = lessonDao.getPage(request);
		int total = lessonDao.getTotal(request.getRule());
		PageResponse<Lesson> response = new PageResponse<Lesson>();
		response.setList(list);
		response.setTotal(total);
		response.setPageCount(request.getPageCount());
		return response;
	}

	@Override
	public Lesson getById(int classId) {
		// TODO Auto-generated method stub
		return lessonDao.getById(classId);
	}

	@Override
	public List<Lesson> getByTecId(int techId) {
		// TODO Auto-generated method stub
		return lessonDao.getByTecId(techId);
	}

	@Override
	public void updateNumLook(Integer classId) {
		// TODO Auto-generated method stub
		lessonDao.updateNumLook(classId);
	}

	@Override
	public void updateNumBuy(Integer classId) {
		// TODO Auto-generated method stub
		lessonDao.updateNumBuy(classId);
	}

	@Override
	public List<Lesson> getPageByCateId(PageRequest request, Integer cateId) {
		// TODO Auto-generated method stub
		return lessonDao.getPageByCateId(request, cateId);
	}

	@Override
	public int getTotal(String rule) {
		// TODO Auto-generated method stub
		return lessonDao.getTotal(rule);
	}

	@Override
	public int getTotalByCateId(Integer cateId) {
		// TODO Auto-generated method stub
		return lessonDao.getTotalByCateId(cateId);
	}

	@Override
	public List<Lesson> getGoodCourse(PageRequest request) {
		// TODO Auto-generated method stub
		return lessonDao.getGoodCourse(request);
	}

	@Override
	public List<Lesson> getPageByTecId(int techId, int start, int pageCount) {
		// TODO Auto-generated method stub
		return lessonDao.getPageByTecId(techId, start, pageCount);
	}

	@Override
	public int countMyLesson(int techId) {
		// TODO Auto-generated method stub
		return lessonDao.countMyLesson(techId);
	}

	@Override
	public Integer selectId() {
		// TODO Auto-generated method stub
		return lessonDao.selectId();
	}

	@Override
	public void insert(Lesson lesson) {
		// TODO Auto-generated method stub
		lessonDao.insert(lesson);
	}

	
}
