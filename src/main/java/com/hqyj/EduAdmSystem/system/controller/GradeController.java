package com.hqyj.EduAdmSystem.system.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hqyj.EduAdmSystem.system.entity.Grade;
import com.hqyj.EduAdmSystem.system.entity.User;

@Controller
@RequestMapping("/gradeController")
public class GradeController extends BaseController {

	@RequestMapping("/queryOneGradeByUserId")
	public String queryOneGradeByUserId(String uId, HttpServletRequest req, HttpServletResponse resp,
			HttpSession session) {
		session.setAttribute("uId", uId);
		List<Grade> grade = gradeService.queryOneGradeByUserId(uId);
		User userByGrade = userService.queryUserByUserId(uId);
		
		session.setAttribute("Grade", grade);
		session.setAttribute("userByGrade", userByGrade);
		return "gradeManage/gradeDetails";
	}

	@RequestMapping("/updateOneGradeByUserId")
	public String updateOneGradeByUserId(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		// 获取session传过来的值
		String uId=(String)session.getAttribute("uId");
		
		List<Grade> grade = gradeService.queryOneGradeByUserId(uId);
		User userByGrade = userService.queryUserByUserId(uId);
		session.setAttribute("Grade", grade);
		session.setAttribute("userByGrade", userByGrade);
		return "gradeManage/gradeDetails";
	}
	
	@RequestMapping("/addOneGrade")
	public String addOneGrade(Grade grade, HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		System.out.println("grade" + grade + "----------------------------------------------------");
		int n=gradeService.addOneGrade(grade);
		System.out.println(n);
		return "gradeManage/gradeAdd";
	}
	
	@RequestMapping("/goUpdateOneGrade")
	public String goUpdateOneGrade(String gId,HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		System.out.println("gId" + gId + "----------------------------------------------------");
		Grade grade=gradeService.queryOneGradeByGid(gId);
		session.setAttribute("Grade", grade);
		System.out.println(grade);
		return "gradeManage/gradeUpdate";
	}
	
	@RequestMapping("/updateOneGrade")
	public void updateOneGrade(Grade grade, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {
		System.out.println("grade" + grade + "----------------------------------------------------");
		int n=gradeService.updateOneGrade(grade);
		System.out.println("n====="+n);
		String uId=(String)session.getAttribute("uId");
		List<Grade> grade_db = gradeService.queryOneGradeByUserId(uId);
		User userByGrade = userService.queryUserByUserId(uId);
		session.setAttribute("Grade", grade_db);
		session.setAttribute("userByGrade", userByGrade);
		PrintWriter out = resp.getWriter();//通过servlet的doget方法获取response对象，通过getWriter方法获取PrintWriter对象
		out.flush();//清空缓存
		out.println("<script>");//输出script标签
		out.println("var index = parent.layer.getFrameIndex(window.name);");//js语句：输出alert语句
		out.println("parent.layer.close(index); ");//js语句：输出网页回退语句
		out.println("</script>");//输出script结尾标签
	}
	
	@RequestMapping("/deleteOneGrade")
	public String deleteOneGrade(String gId,HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		System.out.println("gId" + gId + "----------------------------------------------------");
		int n=gradeService.deleteOneGrade(gId);
		System.out.println(n);
		String uId=(String)session.getAttribute("uId");
		List<Grade> grade_db = gradeService.queryOneGradeByUserId(uId);
		User userByGrade = userService.queryUserByUserId(uId);
		session.setAttribute("Grade", grade_db);
		session.setAttribute("userByGrade", userByGrade);
		return "gradeManage/gradeDetails";
	}
	
}
