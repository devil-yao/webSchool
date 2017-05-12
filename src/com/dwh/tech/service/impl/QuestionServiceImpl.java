package com.dwh.tech.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dwh.tech.dao.QuestionDao;
import com.dwh.tech.entity.Question;
import com.dwh.tech.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Resource
	private QuestionDao dao;
	
	@Override
	public Question selectBydId(int id) {
		// TODO Auto-generated method stub
		return dao.selectBydId(id);
	}

	@Override
	public String getAnswer(int id) {
		// TODO Auto-generated method stub
		return dao.getAnswer(id);
	}

	@Override
	public List<Question> selectBatch(List<Integer> ids) {
		// TODO Auto-generated method stub
		return dao.selectBatch(ids);
	}

	@Override
	public List<Integer> selectId(Integer typeId) {
		// TODO Auto-generated method stub
		return dao.selectId(typeId);
	}

	@Override
	public void insert(Question question) {
		// TODO Auto-generated method stub
		dao.insert(question);
	}

}
