package com.dwh.tech.service;

import java.util.List;

import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.Review;

public interface ReviewService {
	
	int countAll();
	
	List<Review> getPage(PageRequest req,Integer classId);
	
	void insert(Review review);
}
