package com.dwh.tech.service;

import com.dwh.tech.entity.Admin;

public interface AdminService {

	public Admin select(String sysName,String sysPwd);
	
}
