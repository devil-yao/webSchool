package com.dwh.tech.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dwh.tech.dao.CartDao;
import com.dwh.tech.entity.Cart;
import com.dwh.tech.entity.PageRequest;
import com.dwh.tech.entity.PageResponse;
import com.dwh.tech.service.CartService;

@Service
public class CartServiceImpl implements CartService{

	@Resource
	private CartDao cartDao;
	
	@Override
	public List<Cart> select(Integer userId, Integer classId, Integer techId) {
		// TODO Auto-generated method stub
		return cartDao.select(userId, classId, techId);
	}

	@Override
	public void add(Cart cart) {
		// TODO Auto-generated method stub
		cartDao.add(cart);
	}

	@Override
	public PageResponse<Cart> selectPage(int userId, PageRequest request,int status) {
		// TODO Auto-generated method stub
		List<Cart> cart = cartDao.selectPage(userId, request.getStart(), request.getPageCount(),status);
		PageResponse<Cart> page = new PageResponse<Cart>();
		page.setList(cart);
		page.setPageCount(request.getPageCount());
		page.setTotal(cartDao.count(userId));
		return page;
	}

	@Override
	public Cart getByClassId(int classId,int userId) {
		// TODO Auto-generated method stub
		return cartDao.getByClassId(classId,userId);
	}

	@Override
	public int count(int userId) {
		// TODO Auto-generated method stub
		return cartDao.count(userId);
	}

	@Override
	public void deleteCart(int cartId) {
		// TODO Auto-generated method stub
		cartDao.deleteCart(cartId);
	}

	@Override
	public void updateCar(Integer status, int cartId) {
		// TODO Auto-generated method stub
		cartDao.updateCart(status, cartId);
	}

}
