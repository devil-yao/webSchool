package com.dwh.tech.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dwh.tech.dao.VideoDao;
import com.dwh.tech.entity.Video;
import com.dwh.tech.service.VideoService;
@Service
public class VideoServiceImpl implements VideoService {

	@Resource
	private VideoDao videoDao;
	
	public List<Video> getByClssId(Integer classId){
		return videoDao.getByClssId(classId);
	}

	@Override
	public void insert(Video video) {
		// TODO Auto-generated method stub
		videoDao.insert(video);
	}
	
}
