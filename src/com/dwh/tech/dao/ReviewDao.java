package com.dwh.tech.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.Review;

public interface ReviewDao {

	int countAll();
	
	List<Review> getPage(@Param("request")PageRequest req);
	
	void insert(@Param("review")Review review);
}
