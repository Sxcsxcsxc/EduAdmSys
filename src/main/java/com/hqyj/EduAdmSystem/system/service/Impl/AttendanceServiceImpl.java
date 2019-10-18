package com.hqyj.EduAdmSystem.system.service.Impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.EduAdmSystem.system.dao.AttendanceMapper;
import com.hqyj.EduAdmSystem.system.entity.Attendance;
import com.hqyj.EduAdmSystem.system.service.AttendanceService;
import com.hqyj.EduAdmSystem.system.util.Page;
@Service
public class AttendanceServiceImpl implements AttendanceService{
	
	@Autowired 
	private	AttendanceMapper attendanceMapper;	
	@Override
	public List<Attendance> queryAttendanceByUserid(String uId) {				
		return attendanceMapper.queryAttendanceByUserid(uId);
	}
	@Override
	public List<Attendance> queryAttendanceAll() {
		
		return attendanceMapper.queryAttendanceAll();
	}
	@Override
	public List<Attendance> queryStudentAll(int urid) {
		
		return attendanceMapper.queryStudentAll(urid);
	}
	@Override
	public int deleteAttendance(String attenId1) {
		
		return attendanceMapper.deleteAttendance(attenId1);
	}
	@Override
	public int updateAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		return attendanceMapper.updateAttendance(attendance);
	}
	@Override
	public int updateAttendance(String attenId, String sta) {
		// TODO Auto-generated method stub
		return attendanceMapper.updateAttendance_sta(attenId,sta);
	}
	/*-----------------------------------分页-----------------*/
	@Override
	public List<Attendance> queryAttendanceAllByPage(Page<Attendance> page) {
		// TODO Auto-generated method stub
		return attendanceMapper.queryAttendanceAllByPage(page);
	}
	@Override
	public Integer queryAttendanceCountByPage() {
		// TODO Auto-generated method stub
		return attendanceMapper.queryAttendanceCountByPage();
	}
	@Override
	public List<Attendance> queryStudentByPageRid(Page<Attendance> page) {
		// TODO Auto-generated method stub
		return attendanceMapper.queryStudentByPageRid(page);
	}
	@Override
	public Integer queryStudentCountByPageRid() {
		// TODO Auto-generated method stub
		return attendanceMapper.queryStudentCountByPageRid();
	}
	@Override
	public List<Attendance> queryTeacherByPageRid(Page<Attendance> page) {
		// TODO Auto-generated method stub
		return attendanceMapper.queryTeacherByPageRid(page);
	}
	@Override
	public Integer queryTeacherCountByPageRid() {
		// TODO Auto-generated method stub
		return attendanceMapper.queryTeacherCountByPageRid();
	}
	@Override
	public List<Attendance> queryAttendanceAllByPageUid(Page<Attendance> page) {
		// TODO Auto-generated method stub
		return attendanceMapper.queryAttendanceAllByPageUid(page);
	}
	@Override
	public Integer queryAttendanceCountByPageUid(Page<Attendance> page) {
		// TODO Auto-generated method stub
		return attendanceMapper.queryAttendanceCountByPageUid(page);
	}
}
