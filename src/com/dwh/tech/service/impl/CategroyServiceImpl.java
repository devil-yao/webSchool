package com.dwh.tech.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dwh.tech.dao.CategroyDao;
import com.dwh.tech.entity.Categroy;
import com.dwh.tech.service.CategroyService;

@Service
public class CategroyServiceImpl implements CategroyService {

	@Resource
	private CategroyDao categroyDao;
	
	@Override
	public List<Categroy> selectAll() {
		// TODO Auto-generated method stub
		return categroyDao.selectAll();
	}

	@Override
	public Categroy selectById(Integer id) {
		// TODO Auto-generated method stub
		return categroyDao.selectById(id);
	}

}
