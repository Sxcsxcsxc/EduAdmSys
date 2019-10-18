package com.hqyj.EduAdmSystem.system.service.Impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.EduAdmSystem.system.dao.ScheduleMapper;
import com.hqyj.EduAdmSystem.system.entity.Schedule;
import com.hqyj.EduAdmSystem.system.entity.SelectCourse;
import com.hqyj.EduAdmSystem.system.service.ScheduleService;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleMapper scheduleMapper;


	@Override
	public List<Schedule> querySchedule() {
		return scheduleMapper.querySchedule();
	}


	@Override
	public List<Schedule> queryScheduleAll() {
		// TODO Auto-generated method stub
		return scheduleMapper.queryScheduleAll();
	}


	@Override
	public List<Schedule> queryScheduleMon(String uid) {
		// TODO Auto-generated method stub
		return scheduleMapper.queryScheduleMon(uid);
	}

	@Override
	public List<Schedule> queryScheduleTues(String uid) {
		// TODO Auto-generated method stub
		return scheduleMapper.queryScheduleTues(uid);
	}

	@Override
	public List<Schedule> queryScheduleWed(String uid) {
		// TODO Auto-generated method stub
		return scheduleMapper.queryScheduleWed(uid);
	}

	@Override
	public List<Schedule> queryScheduleThur(String uid) {
		// TODO Auto-generated method stub
		return scheduleMapper.queryScheduleThur(uid);
	}

	@Override
	public List<Schedule> queryScheduleFri(String uid) {
		// TODO Auto-generated method stub
		return scheduleMapper.queryScheduleFri(uid);
	}


	@Override
	public List<SelectCourse> queryCourseIsExit(String uId, String cId) {
		// TODO Auto-generated method stub
		return scheduleMapper.queryCourseIsExit(uId,cId);
	}


}
