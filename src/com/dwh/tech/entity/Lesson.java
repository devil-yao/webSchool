package com.dwh.tech.entity;

import com.dwh.tech.util.TechUtil;

/**
 * 课程
 * @author yaojun
 * 2017年4月12日
 *
 */
public class Lesson {

	private Integer classId;
	private Integer techId;
	private String className;
	private double price;
	private String classTime;
	private String picture="default.jpg";
	private String techName;
	private Integer numBuy;
	private Integer numLook;
	private Integer classNum;
	private Integer cateId;
	private Integer status;
	private String cateName;
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
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
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public double getPrice() {
		return TechUtil.format2(price);
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getClassTime() {
		return classTime;
	}
	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getTechName() {
		return techName;
	}
	public void setTechName(String techName) {
		this.techName = techName;
	}
	public Integer getNumBuy() {
		return numBuy;
	}
	public void setNumBuy(Integer numBuy) {
		this.numBuy = numBuy;
	}
	public Integer getNumLook() {
		return numLook;
	}
	public void setNumLook(Integer numLook) {
		this.numLook = numLook;
	}
	public Integer getClassNum() {
		return classNum;
	}
	public void setClassNum(Integer classNum) {
		this.classNum = classNum;
	}
	public Integer getCateId() {
		return cateId;
	}
	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cateId == null) ? 0 : cateId.hashCode());
		result = prime * result + ((cateName == null) ? 0 : cateName.hashCode());
		result = prime * result + ((classId == null) ? 0 : classId.hashCode());
		result = prime * result + ((className == null) ? 0 : className.hashCode());
		result = prime * result + ((classNum == null) ? 0 : classNum.hashCode());
		result = prime * result + ((classTime == null) ? 0 : classTime.hashCode());
		result = prime * result + ((numBuy == null) ? 0 : numBuy.hashCode());
		result = prime * result + ((numLook == null) ? 0 : numLook.hashCode());
		result = prime * result + ((picture == null) ? 0 : picture.hashCode());
		long temp;
		temp = Double.doubleToLongBits(price);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((techId == null) ? 0 : techId.hashCode());
		result = prime * result + ((techName == null) ? 0 : techName.hashCode());
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
		Lesson other = (Lesson) obj;
		if (cateId == null) {
			if (other.cateId != null)
				return false;
		} else if (!cateId.equals(other.cateId))
			return false;
		if (cateName == null) {
			if (other.cateName != null)
				return false;
		} else if (!cateName.equals(other.cateName))
			return false;
		if (classId == null) {
			if (other.classId != null)
				return false;
		} else if (!classId.equals(other.classId))
			return false;
		if (className == null) {
			if (other.className != null)
				return false;
		} else if (!className.equals(other.className))
			return false;
		if (classNum == null) {
			if (other.classNum != null)
				return false;
		} else if (!classNum.equals(other.classNum))
			return false;
		if (classTime == null) {
			if (other.classTime != null)
				return false;
		} else if (!classTime.equals(other.classTime))
			return false;
		if (numBuy == null) {
			if (other.numBuy != null)
				return false;
		} else if (!numBuy.equals(other.numBuy))
			return false;
		if (numLook == null) {
			if (other.numLook != null)
				return false;
		} else if (!numLook.equals(other.numLook))
			return false;
		if (picture == null) {
			if (other.picture != null)
				return false;
		} else if (!picture.equals(other.picture))
			return false;
		if (Double.doubleToLongBits(price) != Double.doubleToLongBits(other.price))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (techId == null) {
			if (other.techId != null)
				return false;
		} else if (!techId.equals(other.techId))
			return false;
		if (techName == null) {
			if (other.techName != null)
				return false;
		} else if (!techName.equals(other.techName))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Lesson [classId=" + classId + ", techId=" + techId + ", className=" + className + ", price=" + price
				+ ", classTime=" + classTime + ", picture=" + picture + ", techName=" + techName + ", numBuy=" + numBuy
				+ ", numLook=" + numLook + ", classNum=" + classNum + ", cateId=" + cateId + ", status=" + status
				+ ", cateName=" + cateName + "]";
	}
}
