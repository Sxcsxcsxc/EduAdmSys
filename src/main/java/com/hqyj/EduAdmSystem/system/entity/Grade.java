package com.hqyj.EduAdmSystem.system.entity;

public class Grade {
	private String gId;
	private String gUid;
	private String gCid;
	private String gGrade;
	private User user;
	private Course course;
	public String getgId() {
		return gId;
	}
	public void setgId(String gId) {
		this.gId = gId;
	}
	public String getgUid() {
		return gUid;
	}
	public void setgUid(String gUid) {
		this.gUid = gUid;
	}
	public String getgCid() {
		return gCid;
	}
	public void setgCid(String gCid) {
		this.gCid = gCid;
	}
	public String getgGrade() {
		return gGrade;
	}
	public void setgGrade(String gGrade) {
		this.gGrade = gGrade;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	@Override
	public String toString() {
		return "Grade [gId=" + gId + ", gUid=" + gUid + ", gCid=" + gCid + ", gGrade=" + gGrade + ", user=" + user
				+ ", course=" + course + "]";
	}
	
}
