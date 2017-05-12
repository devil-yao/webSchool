package com.dwh.tech.entity;

public class PageRequest {

	private Integer current;
	private Integer pageCount = 12;
	private String rule;		//查询条件
	private Integer start;
	
	public static PageRequest build(int current,String rule){
		if(current <= 0){current=1;}
		PageRequest page = new PageRequest();
		page.setCurrent(current);
		page.setRule(rule);
		page.setStart((current-1)*page.getPageCount());
		return page;
	}
	
	private PageRequest(){}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getCurrent() {
		return current;
	}
	public void setCurrent(int current) {
		this.current = current;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.setStart((current-1)*pageCount);
		this.pageCount = pageCount;
	}
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + current;
		result = prime * result + pageCount;
		result = prime * result + ((rule == null) ? 0 : rule.hashCode());
		result = prime * result + start;
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
		PageRequest other = (PageRequest) obj;
		if (current != other.current)
			return false;
		if (pageCount != other.pageCount)
			return false;
		if (rule == null) {
			if (other.rule != null)
				return false;
		} else if (!rule.equals(other.rule))
			return false;
		if (start != other.start)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "PageRequest [current=" + current + ", pageCount=" + pageCount + ", rule=" + rule + ", start=" + start
				+ "]";
	}
	
}
