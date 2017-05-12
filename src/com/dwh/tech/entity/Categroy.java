package com.dwh.tech.entity;

public class Categroy {
	private Integer id;
	private String cateName;
	private Integer parentId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cateName == null) ? 0 : cateName.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((parentId == null) ? 0 : parentId.hashCode());
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
		Categroy other = (Categroy) obj;
		if (cateName == null) {
			if (other.cateName != null)
				return false;
		} else if (!cateName.equals(other.cateName))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (parentId == null) {
			if (other.parentId != null)
				return false;
		} else if (!parentId.equals(other.parentId))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Categroy [id=" + id + ", cateName=" + cateName + ", parentId=" + parentId + "]";
	}
}
