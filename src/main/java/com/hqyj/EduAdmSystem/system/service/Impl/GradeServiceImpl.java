package com.hqyj.EduAdmSystem.system.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.EduAdmSystem.system.dao.GradeMapper;
import com.hqyj.EduAdmSystem.system.entity.Grade;
import com.hqyj.EduAdmSystem.system.service.GradeService;
@Service
public class GradeServiceImpl implements GradeService{
	@Autowired 
	private	GradeMapper gradeMapper;	
		
	@Override
	public java.util.List<Grade> queryOneGradeByUserId(String uId) {
		List<Grade> grade=gradeMapper.queryOneGradeByUserId(uId);
		return grade;
	}

	@Override
	public int addOneGrade(Grade grade) {
		// TODO Auto-generated method stub
		return gradeMapper.addOneGrade(grade);
	}

	@Override
	public int updateOneGrade(Grade grade) {
		// TODO Auto-generated method stub
		return gradeMapper.updateOneGrade(grade);
	}

	@Override
	public Grade queryOneGradeByGid(String gId) {
		// TODO Auto-generated method stub
		return gradeMapper.queryOneGradeByGid(gId);
	}

	@Override
	public int deleteOneGrade(String gId) {
		// TODO Auto-generated method stub
		return gradeMapper.deleteOneGrade(gId);
	}

}
