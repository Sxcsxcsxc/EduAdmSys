package com.hqyj.EduAdmSystem.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hqyj.EduAdmSystem.system.entity.Course;
import com.hqyj.EduAdmSystem.system.entity.Grade;
import com.hqyj.EduAdmSystem.system.util.Page;

@Repository
public interface CourseMapper {

	public List<Course> queryClassroom();


	public int insertClassroom(Course course);

	public int deleteClassroom(String cid);

	public int updateClassroom(Course course);


	public List<Course> queryCourseAll();


	public List<Course> queryClassroomByUserId(String uid);


	public List<Course> queryAllClassroomBypage(Page<Course> page);


	public Integer queryAllClassroomCountByPage(Page<Course> page);


	public List<Course> queryClassroomByUserId(Page<Grade> page);


	public Integer queryAllClassroomCountByUserIdByPage(Page<Grade> page);


}
