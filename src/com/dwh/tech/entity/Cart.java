package com.dwh.tech.entity;

public class Cart {

	private Integer cartId;
	private Integer userId;
	private Integer classId;
	private Integer techId;
	private Integer status;
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public Integer getTechId() {
		return techId;
	}
	public void setTechId(Integer techId) {
		this.techId = techId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cartId;
		result = prime * result + classId;
		result = prime * result + status;
		result = prime * result + techId;
		result = prime * result + userId;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cart other = (Cart) obj;
		if (cartId != other.cartId)
			return false;
		if (classId != other.classId)
			return false;
		if (status != other.status)
			return false;
		if (techId != other.techId)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", userId=" + userId + ", classId=" + classId + ", techId=" + techId
				+ ", status=" + status + "]";
	}
	
}
