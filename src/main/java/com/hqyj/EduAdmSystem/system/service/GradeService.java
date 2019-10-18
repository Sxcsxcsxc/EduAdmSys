package com.hqyj.EduAdmSystem.system.service;

import java.util.List;

import com.hqyj.EduAdmSystem.system.entity.Grade;

public interface GradeService {
	List<Grade> queryOneGradeByUserId(String uId);

	int addOneGrade(Grade grade);

	int updateOneGrade(Grade grade);

	Grade queryOneGradeByGid(String gId);

	int deleteOneGrade(String gId);
}
