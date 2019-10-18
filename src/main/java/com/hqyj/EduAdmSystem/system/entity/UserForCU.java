package com.hqyj.EduAdmSystem.system.entity;

public class UserForCU {
	private String uId;
	private String uUsername;
	private String uPassword;
	private String roleId;
	private String uRealname;
	private String uState;
	private String uRealPW;

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuUsername() {
		return uUsername;
	}

	public void setuUsername(String uUsername) {
		this.uUsername = uUsername;
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getuRealname() {
		return uRealname;
	}

	public void setuRealname(String uRealname) {
		this.uRealname = uRealname;
	}

	public String getuState() {
		return uState;
	}

	public void setuState(String uState) {
		this.uState = uState;
	}

	public String getuRealPW() {
		return uRealPW;
	}

	public void setuRealPW(String uRealPW) {
		this.uRealPW = uRealPW;
	}

	@Override
	public String toString() {
		return "UserForCU [uId=" + uId + ", uUsername=" + uUsername + ", uPassword=" + uPassword + ", roleId=" + roleId
				+ ", uRealname=" + uRealname + ", uState=" + uState + ", uRealPW=" + uRealPW + "]";
	}

}
