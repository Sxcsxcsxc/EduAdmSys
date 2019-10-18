package com.hqyj.EduAdmSystem.system.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface SelectCourseMapper {

	public	int queryCourseIsExit(String uId, String ids);

	public int addCourse(String uId, String string);

}
