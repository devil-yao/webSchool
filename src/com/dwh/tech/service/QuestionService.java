package com.dwh.tech.service;

import java.util.List;

import com.dwh.tech.entity.Question;

public interface QuestionService {

	Question selectBydId(int id);

	String getAnswer(int id);

	List<Question> selectBatch(List<Integer> ids);

	List<Integer> selectId(Integer typeId);
	
	void insert(Question question);
}
