package com.dwh.tech.service;

import java.util.List;

import com.dwh.tech.entity.Lesson;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;

public interface LessonService {

	public PageResponse<Lesson> getPage(PageRequest request);
	
	int getTotal(String rule);
	
	public Lesson getById(int classId);
	
	public List<Lesson> getByTecId(int techId);
	
	public void updateNumLook(Integer classId);
	
	public void updateNumBuy(Integer classId);
	
	public List<Lesson> getPageByCateId(PageRequest request,Integer cateId);
	
	public int getTotalByCateId(Integer cateId);
	
	public List<Lesson> getGoodCourse(PageRequest request);

	List<Lesson> getPageByTecId(int techId,int start,int pageCount);
	
	int countMyLesson(int techId);
	
	Integer selectId();
	
	void insert(Lesson lesson);
}
