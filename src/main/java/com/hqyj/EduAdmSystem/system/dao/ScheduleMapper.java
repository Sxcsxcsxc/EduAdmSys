package com.hqyj.EduAdmSystem.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.hqyj.EduAdmSystem.system.entity.Schedule;
import com.hqyj.EduAdmSystem.system.entity.SelectCourse;

@Repository
public interface ScheduleMapper {
	public Schedule queryScheduleByteacherId(String teaUserId);


	public List<Schedule> querySchedule();


	public List<Schedule> queryScheduleAll();


	public List<Schedule> queryScheduleMon(String uid);

	public List<Schedule> queryScheduleTues(String uid);

	public List<Schedule> queryScheduleWed(String uid);

	public List<Schedule> queryScheduleThur(String uid);

	public List<Schedule> queryScheduleFri(String uid);

	public List<SelectCourse> queryCourseIsExit(String uId, String cId);

}
