package com.hqyj.EduAdmSystem.system.service;

import java.util.List;

import com.hqyj.EduAdmSystem.system.entity.Schedule;
import com.hqyj.EduAdmSystem.system.entity.SelectCourse;

public interface ScheduleService {

	List<Schedule> querySchedule();
	List<Schedule> queryScheduleAll();


	List<Schedule> queryScheduleMon(String uid);

	List<Schedule> queryScheduleTues(String uid);

	List<Schedule> queryScheduleWed(String uid);

	List<Schedule> queryScheduleThur(String uid);

	List<Schedule> queryScheduleFri(String uid);


	List<SelectCourse> queryCourseIsExit(String uId, String cId);

}
