package com.hqyj.EduAdmSystem.system.entity;

import java.util.List;

public class Role {
	private int rid;
	private String rname;
	private List<Menu> menus;
	@Override
	public String toString() {
		return "Role [rid=" + rid + ", rname=" + rname + ", menus=" + menus + "]";
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public List<Menu> getMenus() {
		return menus;
	}
	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
}
