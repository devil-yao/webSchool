package com.dwh.tech.common;

public enum Status {

	NOTPAY(1,"待付款"),
	PAY(2,"已付款"),
	LOST(3,"已失效"),
	NORMAL(4,"正常"),
	ICE(5,"被冻结"),
	DELETE(6,"已删除")
	;
	private int status;
	private String desc;
	private Status(int status,String desc) {
		this.status = status;
		this.desc = desc;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
}
