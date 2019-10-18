package com.hqyj.EduAdmSystem.system.service;

import java.util.List;

import com.hqyj.EduAdmSystem.system.entity.Course;
import com.hqyj.EduAdmSystem.system.entity.Grade;
import com.hqyj.EduAdmSystem.system.util.Page;

public interface CourseService {

	List<Course> queryClassroom();

	int insertClassroom(Course course);

	int deleteClassroom(String cid);

	int updateClassroom(Course course);

	List<Course> queryCourseAll();

	List<Course> queryClassroomByUserId(String uid);

	List<Course> queryAllClassroomBypage(Page<Course> page);

	Integer queryAllClassroomCountByPage(Page<Course> page);

	List<Course> queryClassroomByUserId(Page<Grade> page);

	Integer queryAllClassroomCountByUserIdByPage(Page<Grade> page);

}
