package com.hqyj.EduAdmSystem.system.entity;

import java.util.Date;

public class Attendance {
	private String  attenId;
	private String  attenState;
	private Date  attendCreateTime;
	private User user;
	private Course course;
	public String getAttenId() {
		return attenId;
	}
	public void setAttenId(String attenId) {
		this.attenId = attenId;
	}
	public String getAttenState() {
		return attenState;
	}
	public void setAttenState(String attenState) {
		this.attenState = attenState;
	}
	public Date getAttendCreateTime() {
		return attendCreateTime;
	}
	public void setAttendCreateTime(Date attendCreateTime) {
		this.attendCreateTime = attendCreateTime;
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
		return "Attendance [attenId=" + attenId + ", attenState=" + attenState + ", attendCreateTime="
				+ attendCreateTime + ", user=" + user + ", course=" + course + "]";
	}
	

}
