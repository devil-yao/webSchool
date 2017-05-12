package com.dwh.tech.service;

import java.util.List;

import com.dwh.tech.entity.Video;


public interface VideoService {

	public List<Video> getByClssId(Integer classId);
	
	void insert(Video video);
}
