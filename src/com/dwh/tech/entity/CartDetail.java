package com.dwh.tech.entity;

import com.dwh.tech.util.TechUtil;

public class CartDetail {

	private Integer cartId;
	private Integer classId;
	private Integer techId;
	private String teachName;
	private String lessonName;
	private Double price;
	private String head;
	private String time;
	private String status;
	
	
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
	public Integer getTechId() {
		return techId;
	}
	public void setTechId(Integer techId) {
		this.techId = techId;
	}
	public String getTeachName() {
		return teachName;
	}
	public void setTeachName(String teachName) {
		this.teachName = teachName;
	}
	public String getLessonName() {
		return lessonName;
	}
	public void setLessonName(String lessonName) {
		this.lessonName = lessonName;
	}
	public Double getPrice() {
		return TechUtil.format2(price);
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cartId;
		result = prime * result + classId;
		result = prime * result + ((head == null) ? 0 : head.hashCode());
		result = prime * result + ((lessonName == null) ? 0 : lessonName.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((teachName == null) ? 0 : teachName.hashCode());
		result = prime * result + techId;
		result = prime * result + ((time == null) ? 0 : time.hashCode());
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
		CartDetail other = (CartDetail) obj;
		if (cartId != other.cartId)
			return false;
		if (classId != other.classId)
			return false;
		if (head == null) {
			if (other.head != null)
				return false;
		} else if (!head.equals(other.head))
			return false;
		if (lessonName == null) {
			if (other.lessonName != null)
				return false;
		} else if (!lessonName.equals(other.lessonName))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (teachName == null) {
			if (other.teachName != null)
				return false;
		} else if (!teachName.equals(other.teachName))
			return false;
		if (techId != other.techId)
			return false;
		if (time == null) {
			if (other.time != null)
				return false;
		} else if (!time.equals(other.time))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "CartDetail [cartId=" + cartId + ", classId=" + classId + ", techId=" + techId + ", teachName="
				+ teachName + ", lessonName=" + lessonName + ", price=" + price + ", head=" + head + ", time=" + time
				+ ", status=" + status + "]";
	}
	
}
