package com.hqyj.EduAdmSystem.system.entity;


public class Course {
	private String cId;
	private String cName;
	private String cClassRoom;

	public Course() {
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcClassRoom() {
		return cClassRoom;
	}

	public void setcClassRoom(String cClassRoom) {
		this.cClassRoom = cClassRoom;
	}

	@Override
	public String toString() {
		return "Course [cId=" + cId + ", cName=" + cName + ", cClassRoom=" + cClassRoom + "]";
	}

	

	
	
}
