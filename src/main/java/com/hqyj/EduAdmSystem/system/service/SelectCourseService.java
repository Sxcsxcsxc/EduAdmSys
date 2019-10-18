package com.hqyj.EduAdmSystem.system.service;


public interface SelectCourseService {
	int queryCourseIsExit(String uId, String ids);

	int addCourse(String uId, String string);
}
