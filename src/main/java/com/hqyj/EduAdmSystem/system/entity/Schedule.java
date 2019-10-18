package com.hqyj.EduAdmSystem.system.entity;

public class Schedule {
	private String scheduleId;
	private String scheduleTime;
	private String scheduleDay;
	private Course course;
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getScheduleDay() {
		return scheduleDay;
	}

	public void setScheduleDay(String scheduleDay) {
		this.scheduleDay = scheduleDay;
	}

	public String getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(String scheduleId) {
		this.scheduleId = scheduleId;
	}

	
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}


	public String getScheduleTime() {
		return scheduleTime;
	}

	public void setScheduleTime(String scheduleTime) {
		this.scheduleTime = scheduleTime;
	}

	@Override
	public String toString() {
		return "Schedule [scheduleId=" + scheduleId + ", scheduleTime=" + scheduleTime + ", scheduleDay=" + scheduleDay
				+ ", course=" + course + ", user=" + user + "]";
	}
}
