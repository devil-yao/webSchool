package com.dwh.tech.dao;

import org.apache.ibatis.annotations.Param;

import com.dwh.tech.entity.Admin;

public interface AdminDao {

	public Admin select(@Param("sysName") String sysName,@Param("sysPwd") String sysPwd);
//	sys_user
	
}
