package com.dwh.tech.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dwh.tech.entity.Lesson;
import com.dwh.tech.entity.PageRequest;

public interface LessonDao {

	public List<Lesson> getPage(@Param("request")PageRequest request);
	public List<Lesson> getGoodCourse(@Param("request")PageRequest request);
	public List<Lesson> getPageByCateId(@Param("request")PageRequest request,@Param("cateId")Integer cateId);
	
	public int getTotal(@Param("rule")String rule);
	
	public Lesson getById(@Param("classId")int classId);
	
	public List<Lesson> getByTecId(@Param("techId")int techId);
	
	public void updateNumLook(@Param("classId")Integer classId);
	
	public void updateNumBuy(@Param("classId")Integer classId);
	
	public int getTotalByCateId(@Param("cateId")Integer cateId);
	
	List<Lesson> getPageByTecId(@Param("techId")int techId,@Param("start")int start,@Param("pageCount")int pageCount);

	int countMyLesson(@Param("techId")int techId);
	
	int selectId();
	
	void insert(@Param("lesson")Lesson lesson);
}
