package com.dwh.tech.service;

import java.util.List;

import com.dwh.tech.entity.Categroy;

public interface CategroyService {

	List<Categroy> selectAll();
	
	Categroy selectById(Integer id);
}
