package com.dwh.tech.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dwh.tech.dao.ReviewDao;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.Review;
import com.dwh.tech.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Resource
	private ReviewDao reviewDao;
	
	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return reviewDao.countAll();
	}

	@Override
	public List<Review> getPage(PageRequest req,Integer classId) {
		// TODO Auto-generated method stub
		return reviewDao.getPage(req,classId);
	}

	@Override
	public void insert(Review review) {
		// TODO Auto-generated method stub
		reviewDao.insert(review);
	}

}
