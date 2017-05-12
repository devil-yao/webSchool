package com.dwh.tech.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dwh.tech.entity.Categroy;

public interface CategroyDao {

	List<Categroy> selectAll();
	
	Categroy selectById(@Param("id")Integer id);
}
