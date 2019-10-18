package com.hqyj.EduAdmSystem.system.entity;

public class User {
	private String uId;
	private String uUsername;
	private String uPassword;
	private String uRealname;
	private String uState;
	private Role role;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getuRealPW() {
		return uRealPW;
	}

	public void setuRealPW(String uRealPW) {
		this.uRealPW = uRealPW;
	}

	@Override
	public String toString() {
		return "User [uId=" + uId + ", uUsername=" + uUsername + ", uPassword=" + uPassword + ", uRealname=" + uRealname
				+ ", uState=" + uState + ", role=" + role + ", uRealPW=" + uRealPW + "]";
	}

}
