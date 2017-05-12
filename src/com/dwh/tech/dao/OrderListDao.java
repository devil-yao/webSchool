package com.dwh.tech.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dwh.tech.entity.OrderList;

public interface OrderListDao {

	void insertOrder(@Param("order")OrderList order);

	List<OrderList> selectByUserId(@Param("userId")int userId,@Param("status")Integer status,@Param("start")Integer start,@Param("pageCount")Integer pageCount);
	
	int countAll(@Param("userId")int userId,@Param("status")Integer status);
	
	List<OrderList> searchByUserId(@Param("order")OrderList order);
	
	OrderList getOne(@Param("userId")Integer userId, @Param("classId")Integer classId);
}
