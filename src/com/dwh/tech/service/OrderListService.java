package com.dwh.tech.service;

import java.util.List;

import com.dwh.tech.entity.OrderList;

public interface OrderListService {

	void insertOrder(OrderList order);

//	PageResponse<OrderList> selectByUserId(int userId,Integer status,PageRequest request);
	
	int countAll(int userId,Integer status);
	
	OrderList getOne(Integer userId,Integer classId);
	
	List<OrderList> selectByUserId(int userId,Integer status,Integer start,Integer pageCount);
	
	List<OrderList> searchByUserId(OrderList order);
}
