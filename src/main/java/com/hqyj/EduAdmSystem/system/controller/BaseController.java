package com.hqyj.EduAdmSystem.system.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.hqyj.EduAdmSystem.system.service.AttendanceService;
import com.hqyj.EduAdmSystem.system.service.CourseService;
import com.hqyj.EduAdmSystem.system.service.GradeService;
import com.hqyj.EduAdmSystem.system.service.MenuService;
import com.hqyj.EduAdmSystem.system.service.RoleService;
import com.hqyj.EduAdmSystem.system.service.ScheduleService;
import com.hqyj.EduAdmSystem.system.service.SelectCourseService;
import com.hqyj.EduAdmSystem.system.service.UserService;

public class BaseController {
	@Autowired
	public UserService userService;
	@Autowired
	public RoleService roleService;
	@Autowired
	public MenuService menuService;
	@Autowired
	public AttendanceService attendanceService;
	@Autowired
	public CourseService courseService;
	@Autowired
	public ScheduleService scheduleService;
	@Autowired
	public GradeService gradeService;
	@Autowired
	public SelectCourseService selectCourseService;
}
