package com.dwh.tech.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dwh.tech.entity.Video;

public interface VideoDao {

	public List<Video> getByClssId(@Param("classId") Integer classId);
	
	void insert(@Param("video")Video video); 
}
