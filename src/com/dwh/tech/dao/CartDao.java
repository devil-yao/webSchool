package com.dwh.tech.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.dwh.tech.entity.Cart;

public interface CartDao {

	List<Cart> select(@Param("userId")Integer userId,@Param("classId")Integer classId,@Param("techId")Integer techId);
	
	void add(@Param("cart")Cart cart);
	
	List<Cart> selectPage(@Param("userId")int userId,@Param("start")int start,@Param("pageCount")int pageCount,@Param("status")int status);
	
	Cart getByClassId(@Param("classId")int classId,@Param("userId")int userId);
	
	int count(@Param("userId")int userId);
	
	void deleteCart(@Param("cartId")int cartId);
	
	void updateCart(@Param("status")Integer status,@Param("cartId")int cartId);
}
