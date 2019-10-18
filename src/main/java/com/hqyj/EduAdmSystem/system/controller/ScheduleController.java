package com.hqyj.EduAdmSystem.system.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hqyj.EduAdmSystem.system.entity.Schedule;

@Controller
@RequestMapping("/scheduleController")
public class ScheduleController extends BaseController {
	
	@RequestMapping("/queryCourseAll")
	public String queryCourseAll(HttpSession session) {
		List<Schedule> schedule = scheduleService.queryScheduleAll();
		session.setAttribute("Schedule", schedule);
		System.out.println("#################################################################################");
		System.out.println(schedule);
		return "scheduleManage/courseList";
	}

	@RequestMapping("/queryCourseWeek")
	public String queryCourseWeek(HttpSession session, Model model,String Uid) {
		List<Schedule> scheduleMon = scheduleService.queryScheduleMon(Uid);
		List<Schedule> scheduleTues = scheduleService.queryScheduleTues(Uid);
		List<Schedule> scheduleWed = scheduleService.queryScheduleWed(Uid);
		List<Schedule> scheduleThur = scheduleService.queryScheduleThur(Uid);
		List<Schedule> scheduleFri = scheduleService.queryScheduleFri(Uid);
		session.setAttribute("scheduleMon", scheduleMon);
		session.setAttribute("scheduleTues", scheduleTues);
		session.setAttribute("scheduleWed", scheduleWed);
		session.setAttribute("scheduleThur", scheduleThur);
		session.setAttribute("scheduleFri", scheduleFri);
		System.out.println("#################################################################################");
		System.out.println(scheduleMon);
		System.out.println(scheduleTues);
		System.out.println(scheduleWed);
		System.out.println(scheduleThur);
		System.out.println(scheduleFri);
		return "scheduleManage/stuCourse";
	}

	@RequestMapping("/addSCourse")
	public String addSCourse(HttpServletRequest req,Model model,HttpSession session, String uIds) {
		System.out.println("用户Id" + uIds);
		session.setAttribute("flags", "1");
		int m = selectCourseService.queryCourseIsExit(uIds,"4");
		if(m!=1)
			selectCourseService.addCourse(uIds, "4");
		String[] ids = req.getParameterValues("id[]");
		for (String string : ids) {
			int n = selectCourseService.queryCourseIsExit(uIds,string);
			System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n" + n);
			System.out.println(string);
			if (n == 1) {
				model.addAttribute("erro_mes", "编号为"+string+"的课程已经添加，切勿重复添加！！！");
				return "scheduleManage/courseList";
			}
			else{
				selectCourseService.addCourse(uIds, string);
			}
		}
		model.addAttribute("erro_mes", "课程添加成功！！！");
		return "scheduleManage/courseList";
	}
}

