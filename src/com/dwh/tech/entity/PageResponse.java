package com.dwh.tech.entity;

import java.util.List;

public class PageResponse<T> {

	private List<T> list;
	private int total;
	private int pageCount;
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((list == null) ? 0 : list.hashCode());
		result = prime * result + pageCount;
		result = prime * result + total;
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
		@SuppressWarnings("unchecked")
		PageResponse<T> other = (PageResponse<T>) obj;
		if (list == null) {
			if (other.list != null)
				return false;
		} else if (!list.equals(other.list))
			return false;
		if (pageCount != other.pageCount)
			return false;
		if (total != other.total)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "PageResponse [list=" + list + ", total=" + total + ", pageCount=" + pageCount + "]";
	}
	
}
