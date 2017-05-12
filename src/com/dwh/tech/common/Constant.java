package com.dwh.tech.common;

public enum Constant {

	SUCCESS(1,"密码修改成功"),
	FAIL(2,"系统错误，请稍后再试"),
	OLDFAIL(3,"旧密码不正确"),
	SAME(4,"新密码不能和旧密码一样")
	;
	private int code;
	private String desc;
	
	private  Constant(int code,String desc){
		this.code = code;
		this.desc = desc;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
}
