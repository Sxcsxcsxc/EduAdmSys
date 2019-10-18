package com.hqyj.EduAdmSystem.system.controller;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hqyj.EduAdmSystem.system.entity.Course;
import com.hqyj.EduAdmSystem.system.entity.Grade;
import com.hqyj.EduAdmSystem.system.entity.User;
import com.hqyj.EduAdmSystem.system.util.Page;

@Controller
@RequestMapping("/courseController")
public class CourseController extends BaseController{
	private static ConcurrentMap<String, Object> concurrentMap = new ConcurrentHashMap<String, Object>();
	@RequestMapping("/queryCourseAll")
	public String queryCourseAll(HttpSession session) {
		List<Course> course = courseService.queryCourseAll();
		session.setAttribute("Course", course);
		System.out.println();
		System.out.println(course + "--------------");
		return "gradeManage/gradeAdd";
	}
	// yll:教室:查询
		@RequestMapping(value = "/query/queryClassroom", produces = "application/json;charset=utf-8")
		public @ResponseBody ConcurrentMap<String, Object> queryAllClassroomBypage(Course course,String roleId ,Page<Course> page,@RequestParam("limit") int limit){
			System.out.println("###########################");
			System.out.println("#       classroom         #");
			System.out.println("#         query          #");
			System.out.println("###########################");
			
			page.setT(course);
			page.setRows(limit);
			
			System.err.println(page);
			
			List<Course> courses = courseService.queryAllClassroomBypage(page);
			Integer queryCount_db = courseService.queryAllClassroomCountByPage(page);
			page.setTotalRecord(queryCount_db);
			
			System.err.println("queryAllClassroomBypage : "+courses);
			System.err.println("queryAllClassroomCountByPage : "+queryCount_db);
			
			concurrentMap.put("count", queryCount_db);
			concurrentMap.put("data", courses);
			concurrentMap.put("code", 0);
			concurrentMap.put("msg", "成功");
			
			
			return concurrentMap;
		}
		
/*		// yll:教室:查询
		@RequestMapping(value = "/query/queryClassroom", produces = "application/json;charset=utf-8")
		public @ResponseBody String queryClassroom() throws Exception {
			System.out.println("###########################");
			System.out.println("#       classroom         #");
			System.out.println("#         query          #");
			System.out.println("###########################");
			List<Course> courses = courseService.queryClassroom();
			ObjectMapper om = new ObjectMapper();
			String jsonStr = om.writeValueAsString(courses);
			System.out.println("queryClassroom-------->json : " + jsonStr);
			return "{\"code\":0,\"msg\":\"\",\"count\":1000,\"data\":" + jsonStr + "}";
		}
		
*/		// yll:教室:增加
		@RequestMapping( value = "/insert/insertClassroom",produces = "application/json;charset=utf-8")
		public @ResponseBody String insertClassroom(HttpServletResponse resp,Course course) throws Exception {
			System.out.println("###########################");
			System.out.println("#       classroom         #");
			System.out.println("#         insert          #");
			System.out.println("###########################");
//			course.setcId(PrimaryKeyUtil.getPrimaryKey());
//			course.setcName("犬夜叉");
//			course.setcClassRoom("19084");
			int ins_db = courseService.insertClassroom(course);
			System.out.println("insert返回值 ： "+ins_db);
			
			return ""+ins_db;
		}
		
		// yll:教室:删除
		@RequestMapping( value = "/_delete_/deleteClassroom",produces = "application/json;charset=utf-8")
		public @ResponseBody String deleteClassroom(HttpServletResponse resp,Course course,String cId) throws Exception {
			System.out.println("###########################");
			System.out.println("#       classroom         #");
			System.out.println("#         delete          #");
			System.out.println("###########################");
			String cid=cId;
			int del_db = courseService.deleteClassroom(cid);
			System.out.println("del返回值 ： "+del_db);
			
			return ""+del_db;
		}
		
		// yll:教室:修改
		@RequestMapping( value = "/update/updateClassroom",produces = "application/json;charset=utf-8")
		public @ResponseBody String updateClassroom(HttpServletResponse resp,Course course) throws Exception {
			System.out.println("###########################");
			System.out.println("#       classroom         #");
			System.out.println("#         update          #");
			System.out.println("###########################");
//			System.out.println(course);
			int upd_db = courseService.updateClassroom(course);
			System.out.println("upd返回值 ： "+upd_db);
			
			return ""+upd_db;
		}
		
		// yll:教室:查询教室通过UserId
				@RequestMapping(value = "/query/queryClassroomByUserId", produces = "application/json;charset=utf-8")
				public @ResponseBody ConcurrentMap<String, Object> queryClassroomByUserId(Course course,String roleId ,Page<Grade> page,@RequestParam("limit") int limit) throws Exception {
					System.out.println("###########################");
					System.out.println("#       classroom         #");
					System.out.println("#     queryByUserId       #");
					System.out.println("###########################");
					
					Grade grade = new Grade();
					
					
					
					Subject subject = SecurityUtils.getSubject();
					User user = (User) subject.getSession().getAttribute("user_session");
					
					System.err.println(user);
					grade.setCourse(course);
					grade.setUser(user);
					page.setT(grade);
					page.setRows(limit);
					
					List<Course> courses = courseService.queryClassroomByUserId(page);
					Integer queryCount_db = courseService.queryAllClassroomCountByUserIdByPage(page);
					page.setTotalRecord(queryCount_db);
					concurrentMap.put("count", queryCount_db);
					concurrentMap.put("data", courses);
					concurrentMap.put("code", 0);
					concurrentMap.put("msg", "成功");
					return concurrentMap;
				}
				
}
