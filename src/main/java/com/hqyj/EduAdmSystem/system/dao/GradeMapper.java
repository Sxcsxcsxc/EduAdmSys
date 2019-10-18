package com.hqyj.EduAdmSystem.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hqyj.EduAdmSystem.system.entity.Grade;

@Repository
public interface GradeMapper {

	public  List<Grade> queryOneGradeByUserId(String uId);

	public int addOneGrade(Grade grade);

	public int updateOneGrade(Grade grade);

	public Grade queryOneGradeByGid(String gId);

	public int deleteOneGrade(String gId);

}
