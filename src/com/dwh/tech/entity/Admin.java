package com.dwh.tech.entity;

public class Admin {

	private Integer id;
	private String sysName;
	private String sysPwd;
	private Integer status;
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	private Integer role;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public String getSysPwd() {
		return sysPwd;
	}
	public void setSysPwd(String sysPwd) {
		this.sysPwd = sysPwd;
	}
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((sysName == null) ? 0 : sysName.hashCode());
		result = prime * result + ((sysPwd == null) ? 0 : sysPwd.hashCode());
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
		Admin other = (Admin) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (role == null) {
			if (other.role != null)
				return false;
		} else if (!role.equals(other.role))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (sysName == null) {
			if (other.sysName != null)
				return false;
		} else if (!sysName.equals(other.sysName))
			return false;
		if (sysPwd == null) {
			if (other.sysPwd != null)
				return false;
		} else if (!sysPwd.equals(other.sysPwd))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", sysName=" + sysName + ", sysPwd=" + sysPwd + ", status=" + status + ", role="
				+ role + "]";
	}
}
