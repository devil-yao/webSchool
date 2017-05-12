package com.dwh.tech.service;

import java.util.List;

import com.dwh.tech.entity.Cart;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;

public interface CartService {

		List<Cart> select(Integer userId,Integer classId,Integer techId);
		
		void add(Cart cart);
		
		PageResponse<Cart> selectPage(int userId, PageRequest request,int status);
		
		Cart getByClassId(int classId,int userId);
		
		int count(int userId);
		
		void deleteCart(int cartId);
		
		void updateCar(Integer status,int cartId);
}
