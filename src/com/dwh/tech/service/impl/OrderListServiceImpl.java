package com.dwh.tech.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dwh.tech.dao.OrderListDao;
import com.dwh.tech.entity.OrderList;
import com.dwh.tech.service.OrderListService;

@Service
public class OrderListServiceImpl implements OrderListService {

	@Resource
	private OrderListDao orderListDao;
	
	@Override
	public void insertOrder(OrderList order) {
		// TODO Auto-generated method stub
		orderListDao.insertOrder(order);
	}

//	@Override
//	public PageResponse<OrderList> selectByUserId(int userId, Integer status, PageRequest request) {
//		// TODO Auto-generated method stub
//		int num = orderListDao.countAll(userId, status);
//		PageResponse<OrderList> resp = new PageResponse<OrderList>();
//		resp.setPageCount(request.getPageCount());
//		resp.setTotal(num);
//		return resp;
//	}

	@Override
	public List<OrderList> selectByUserId(int userId, Integer status, Integer start, Integer pageCount) {
		// TODO Auto-generated method stub
		return orderListDao.selectByUserId(userId, status, start, pageCount);
	}

	@Override
	public int countAll(int userId, Integer status) {
		// TODO Auto-generated method stub
		return orderListDao.countAll(userId, status);
	}

	@Override
	public List<OrderList> searchByUserId(OrderList order) {
		// TODO Auto-generated method stub
		return orderListDao.searchByUserId(order);
	}

	@Override
	public OrderList getOne(Integer userId, Integer classId) {
		// TODO Auto-generated method stub
		return orderListDao.getOne(userId,classId);
	}


}
