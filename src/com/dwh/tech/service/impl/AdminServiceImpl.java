package com.dwh.tech.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dwh.tech.dao.AdminDao;
import com.dwh.tech.entity.Admin;
import com.dwh.tech.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Resource
	private AdminDao adminDao;
	
	@Override
	public Admin select(String sysName, String sysPwd) {
		// TODO Auto-generated method stub
		return adminDao.select(sysName, sysPwd);
	}

}
