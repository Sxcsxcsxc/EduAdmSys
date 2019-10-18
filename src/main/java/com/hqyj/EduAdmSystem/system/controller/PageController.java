package com.hqyj.EduAdmSystem.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pageController")
public class PageController {
	@RequestMapping("/error")
	public String error() {
		return "error";
	}

	@RequestMapping("/main")
	public String main() {
		return "main";
	}
	@RequestMapping("/personal")
	public String Personal() {
		return "userManage/personal";
	}
	
	/**
	 * <p>
	 * 跳转通过角色id查询用户信息
	 * </p>
	 * 
	 * @author sxc
	 * @Date 2019年10月14日
	 * @param roleId
	 * @param model
	 * @param choose
	 * @return
	 */
	@RequestMapping("/userList")
	public String userList(String roleId, Model model, String choose) {
		System.out.println("----------------------------------------");
		model.addAttribute("roleId", roleId);
		if ("1".equals(choose)) {
			return "userManage/userList";
		} else if ("2".equals(choose)) {
			return "gradeManage/gradeIndex";
		} else {
			return "error";
		}
	}

	@RequestMapping("/queryAllUserListByPage")
	public String queryAllUserListByPage(String roleId, Model model) {
		model.addAttribute("roleId", roleId);
		return "userManage/UserListByPage";
	}

	@RequestMapping("/addUserByUser")
	public String addUserByUser() {
		return "userManage/addUserByUser";
	}

	@RequestMapping("/editUserRole")
	public String editUserRole() {
		return "userManage/editUserRole";
	}

	@RequestMapping("/testList")
	public String list(Model model) {
		return "testList";
	}

	@RequestMapping("/classroomList")
	public String classroomList() {
		return "courseManage/classroomList";
	}

	@RequestMapping("/userClassroom")
	public String userClassroom() {
		return "courseManage/userClassroom";
	}

	@RequestMapping("/userSchedule")
	public String userSchedule() {
		return "scheduleManage/scheduleList";
	}

	/**
	 * #####查询所有人员考勤##### 校长
	 */
	@RequestMapping("/attendanceList")
	public String attendanceList() {
		return "attendanceManage/attendanceListTest";
	}

	/**
	 * #####查询自身考勤通过uId#####
	 */
	@RequestMapping("/attendanceListMyself")
	public String attendanceListMyself() {
		return "attendanceManage/attendanceListMyself";
	}

	/**
	 * #####《《查询/修改/删除》》所有学生考勤通过用户表角色Id#####
	 */
	@RequestMapping("/attendanceListStudentAll")
	public String attendanceListStudentAll() {
		return "attendanceManage/attendanceListStudentAll";
	}

	/**
	 * #####仅限于查询所有学生考勤通过用户表角色Id#####
	 */
	@RequestMapping("/attendanceListStudentAllC")
	public String attendanceListStudentAllC() {
		return "attendanceManage/attendanceListStudentC";
	}

	/**
	 * #####《《查询/修改/删除》》所有老师考勤通过用户表角色Id#####
	 */
	@RequestMapping("/attendanceListTeacherAll")
	public String attendanceListTeacherAll() {
		return "attendanceManage/attendanceListTeacherAll";
	}

	/**
	 * #####仅限于查询所有老师考勤通过用户表角色Id#####
	 */
	@RequestMapping("/attendanceListTeacherAllC")
	public String attendanceListTeacherAllC() {
		return "attendanceManage/attendanceListTeacherC";
	}

	@RequestMapping("/gogradeDetails")
	public String gogradeDatails() {
		return "gradeManage/gradeDetails";
	}

}
