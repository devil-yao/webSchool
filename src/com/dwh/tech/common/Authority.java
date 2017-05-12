package com.dwh.tech.common;

public enum Authority {

	STUDENT(1),
	TEACHER(2),
	ADMIN(3);
	private int authority;
	private Authority(int authority){
		this.authority = authority;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	
}
