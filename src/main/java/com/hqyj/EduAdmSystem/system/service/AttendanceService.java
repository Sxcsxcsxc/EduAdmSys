package com.hqyj.EduAdmSystem.system.service;

import java.util.List;

import com.hqyj.EduAdmSystem.system.entity.Attendance;
import com.hqyj.EduAdmSystem.system.util.Page;

public interface AttendanceService {
	public  List<Attendance>  queryAttendanceByUserid(String uId);
	public  List<Attendance>  queryAttendanceAll();
	public List<Attendance> queryStudentAll(int urId);
	public int deleteAttendance(String attenId1);
	public int updateAttendance(Attendance attendance);
	public int updateAttendance(String attenId, String sta);
	
	/*==================分页============================*/
	public List<Attendance> queryAttendanceAllByPage(Page<Attendance> page);
	public Integer queryAttendanceCountByPage();
	public List<Attendance> queryStudentByPageRid(Page<Attendance> page);
	public Integer queryStudentCountByPageRid();
	public List<Attendance> queryTeacherByPageRid(Page<Attendance> page);
	public Integer queryTeacherCountByPageRid();
	public List<Attendance> queryAttendanceAllByPageUid(Page<Attendance> page);
	public Integer queryAttendanceCountByPageUid(Page<Attendance> page);
	
}
