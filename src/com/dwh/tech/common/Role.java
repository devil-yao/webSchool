package com.dwh.tech.common;

public enum Role {

	ADMIN(1),
	PUBLIC(0);
	private int code;
	private Role(int code){
		this.code = code;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
}
