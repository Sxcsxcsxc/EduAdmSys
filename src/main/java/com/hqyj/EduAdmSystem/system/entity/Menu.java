package com.hqyj.EduAdmSystem.system.entity;

import java.util.List;

public class Menu {
	private int mid;
	private String mname;
	private String mlink;
	private List<Role> roles;
	
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMlink() {
		return mlink;
	}
	public void setMlink(String mlink) {
		this.mlink = mlink;
	}
	@Override
	public String toString() {
		return "Menu [mid=" + mid + ", mname=" + mname + ", mlink=" + mlink + ", roles=" + roles + "]";
	}
}
