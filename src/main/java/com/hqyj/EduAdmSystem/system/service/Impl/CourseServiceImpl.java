package com.hqyj.EduAdmSystem.system.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.EduAdmSystem.system.dao.CourseMapper;
import com.hqyj.EduAdmSystem.system.entity.Course;
import com.hqyj.EduAdmSystem.system.entity.Grade;
import com.hqyj.EduAdmSystem.system.service.CourseService;
import com.hqyj.EduAdmSystem.system.util.Page;

@Service
public class CourseServiceImpl implements CourseService {
	@Autowired
	private CourseMapper courseMapper;

	@Override
	public List<Course> queryClassroom() {
		return courseMapper.queryClassroom();
	}

	@Override
	public int insertClassroom(Course course) {
		return courseMapper.insertClassroom(course);
	}

	@Override
	public int deleteClassroom(String cid) {
		return courseMapper.deleteClassroom(cid);
	}

	@Override
	public int updateClassroom(Course course) {
		return courseMapper.updateClassroom(course);
	}

	@Override
	public List<Course> queryCourseAll() {
		return courseMapper.queryCourseAll();
	}

	@Override
	public List<Course> queryClassroomByUserId(String uid) {
		return courseMapper.queryClassroomByUserId(uid);
	}

	@Override
	public List<Course> queryAllClassroomBypage(Page<Course> page) {
		
		List<Course> list = courseMapper.queryAllClassroomBypage(page);
		return list;
	}

	@Override
	public Integer queryAllClassroomCountByPage(Page<Course> page) {
		return courseMapper.queryAllClassroomCountByPage(page);
	}

	@Override
	public List<Course> queryClassroomByUserId(Page<Grade> page) {
		// TODO Auto-generated method stub
		return courseMapper.queryClassroomByUserId(page);
	}

	@Override
	public Integer queryAllClassroomCountByUserIdByPage(Page<Grade> page) {
		return courseMapper.queryAllClassroomCountByUserIdByPage( page);
	}

	
}
