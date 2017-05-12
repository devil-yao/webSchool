package com.dwh.tech.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.dwh.tech.entity.Question;

@Repository
public interface QuestionDao {

	public Question selectBydId(@Param("id")int id);
	
	public String getAnswer(@Param("id")int id);
	
	public List<Question> selectBatch(@Param("ids")List<Integer> id);
	
	public List<Integer> selectId(@Param("typeId")Integer typeId);
	
	void insert(@Param("question")Question question);
}
