package com.hqyj.EduAdmSystem.system.entity;

public class SelectCourse {
	private int scId;
	private String scUid;
	private	String scSchenduleId;
	public String getScUid() {
		return scUid;
	}
	
	public int getScId() {
		return scId;
	}

	public void setScId(int scId) {
		this.scId = scId;
	}

	public void setScUid(String scUid) {
		this.scUid = scUid;
	}
	public String getScSchenduleId() {
		return scSchenduleId;
	}
	public void setScSchenduleId(String scSchenduleId) {
		this.scSchenduleId = scSchenduleId;
	}
	@Override
	public String toString() {
		return "SelectCourse [scId=" + scId + ", scUid=" + scUid + ", scSchenduleId=" + scSchenduleId + "]";
	}
	
}
