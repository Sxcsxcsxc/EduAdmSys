package com.hqyj.EduAdmSystem.system.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.EduAdmSystem.system.dao.SelectCourseMapper;
import com.hqyj.EduAdmSystem.system.entity.SelectCourse;
import com.hqyj.EduAdmSystem.system.service.SelectCourseService;

@Service
public class SelectCourseServiceImpl implements SelectCourseService{
	@Autowired
	private SelectCourseMapper sm;
	@Override
	public int queryCourseIsExit(String uId, String ids) {
		// TODO Auto-generated method stub
		return sm.queryCourseIsExit(uId,ids);
	}
	@Override
	public int addCourse(String uId, String string) {
		
		return sm.addCourse(uId,string);
	}
}
