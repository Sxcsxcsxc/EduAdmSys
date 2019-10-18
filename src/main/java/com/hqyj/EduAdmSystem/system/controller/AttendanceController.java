package com.hqyj.EduAdmSystem.system.controller;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.EduAdmSystem.system.entity.Attendance;
import com.hqyj.EduAdmSystem.system.entity.User;
import com.hqyj.EduAdmSystem.system.util.Page;



/**
 * @author xieqilin
 *
 */
@Controller
@RequestMapping("/attendanceController")
public class AttendanceController extends BaseController {
	private static ConcurrentMap<String, Object> concurrentMap = new ConcurrentHashMap<String, Object>();
	/**
	 *######查询自身考勤通过用户ID######
	 *》》》》》》》》》》》》》学生和讲师通道
	 *
	 */
	@RequestMapping(value ="/query/Myself")
	@ResponseBody
	public ConcurrentMap<String, Object> queryMyself(){
		System.out.println("++++++++++++++++++++++++++++++++++");
		System.out.println("+		学		自		老		 +");
		System.out.println("+				身				 +");
		System.out.println("+				考				 +");
		System.out.println("+		生		勤		师		 +");
		System.out.println("++++++++++++++++++++++++++++++++++");
		User user_session = (User) SecurityUtils.getSubject().getSession().getAttribute("user_session");
		String uId = user_session.getuId();
		System.out.println("---------user_session------------"+user_session);
		List<Attendance>  attendanceAll_db= attendanceService.queryAttendanceByUserid(uId);
		concurrentMap.put("count", 10);
		concurrentMap.put("data", attendanceAll_db);
		concurrentMap.put("code", 0);
		concurrentMap.put("msg", "成功");
		System.err.println("-----attendance---queryStudentAll()---concurrentMap：" + concurrentMap);
		return concurrentMap;
	}
	/*
	 * ######################后面有问题怎么去取角色rId而且只能是固定的############################################3
	 */
	
	
	/**
	 *#####查询全部考勤包括老师和学生#####
	 *》》》》》》》》》》》》校长通道
	 *
	 */	
	@RequestMapping(value ="/query/All")
	@ResponseBody
	public ConcurrentMap<String, Object> queryAttendanceAll(){
		System.out.println("++++++++++++++++++++++++++++++++++");
		System.out.println("+		校		全				 +");
		System.out.println("+				部				 +");
		System.out.println("+				考				 +");
		System.out.println("+		长		勤				 +");
		System.out.println("++++++++++++++++++++++++++++++++++");
		List<Attendance>  attendanceAll_db= attendanceService.queryAttendanceAll();
		concurrentMap.put("count", 1000);
		concurrentMap.put("data", attendanceAll_db);
		concurrentMap.put("code", 0);
		concurrentMap.put("msg", "成功");
		//System.err.println("-----attendance---queryAttendanceAll( )---concurrentMap：" + concurrentMap);
		return concurrentMap;
	}
	/**
	 *#####查询所有学生考勤通过用户表角色Id#####
	 *》》》》》》》》》》》》主任通道
	 *
	 */	
	@RequestMapping(value ="/query/StudentAll")
	@ResponseBody
	public ConcurrentMap<String, Object> queryStudentAll( ){
		System.out.println("++++++++++++++++++++++++++++++++++");
		System.out.println("+			所	学				 +");
		System.out.println("+				生				 +");
		System.out.println("+				考				 +");
		System.out.println("+			有	勤				 +");
		System.out.println("++++++++++++++++++++++++++++++++++");
		
		int urId = 4;
		
		List<Attendance>  attendanceAll_db= attendanceService.queryStudentAll(urId);
		concurrentMap.put("count", 10);
		concurrentMap.put("data", attendanceAll_db);
		concurrentMap.put("code", 0);
		concurrentMap.put("msg", "成功");
		//System.err.println("-----attendance---queryStudentAll()---concurrentMap：" + concurrentMap);
		return concurrentMap;
	}
	@RequestMapping(value ="/query/TeacherAll")
	@ResponseBody
	public ConcurrentMap<String, Object> queryTeacherAll(Integer urId ){
		System.out.println("++++++++++++++++++++++++++++++++++");
		System.out.println("+			所	讲				 +");
		System.out.println("+				师				 +");
		System.out.println("+				考				 +");
		System.out.println("+			有	勤				 +");
		System.out.println("++++++++++++++++++++++++++++++++++");
		
		int urId1 =3;
		
		List<Attendance>  attendanceAll_db= attendanceService.queryStudentAll(urId1);
		concurrentMap.put("count", 10);
		concurrentMap.put("data", attendanceAll_db);
		concurrentMap.put("code", 0);
		concurrentMap.put("msg", "成功");
		//System.err.println("-----attendance---queryStudentAll()---concurrentMap：" + concurrentMap);
		return concurrentMap;
		
	}
	/*========================================删除================================================================*/
	@RequestMapping(value ="/_delete_/deleteAttendance",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String deleteAttendance(HttpServletResponse resp,Attendance attendance,String attenId ){
		System.out.println("++++++++++++++++++++++++++++++++++");
		System.out.println("+			删	师	校			 +");
		System.out.println("+				生	长			 +");
		System.out.println("+				考	权			 +");
		System.out.println("+			除	勤	限			 +");
		System.out.println("++++++++++++++++++++++++++++++++++");
		
		int del_db= attendanceService.deleteAttendance(attenId);
		System.out.println("del返回值 ： "+del_db);
		//System.err.println("-----attendance---queryStudentAll()---concurrentMap：" + concurrentMap);
		return del_db+"";
		/*========================================修改考勤状态================================================================*/	
	}
	@RequestMapping(value ="/_update_0/updateAttendance",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateAttendance0(HttpServletResponse resp,Attendance attendance,String attenId ){
		System.out.println("+			缺勤打卡			 +");
		String sta="0";
		int del_db= attendanceService.updateAttendance(attenId,sta);
		System.out.println("del返回值 ： "+del_db);
		//System.err.println("-----attendance---queryStudentAll()---concurrentMap：" + concurrentMap);
		return del_db+"";
		
	}
	@RequestMapping(value ="/_update_1/updateAttendance",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateAttendance1(HttpServletResponse resp,Attendance attendance,String attenId ){
		System.out.println("+			打卡			 +");
		String sta="1";
		int del_db= attendanceService.updateAttendance(attenId,sta);
		//System.err.println("-----attendance---queryStudentAll()---concurrentMap：" + concurrentMap);
		return del_db+"";
		
	}
	/*
	========================================修改================================================================
	@RequestMapping(value ="/update/updateAttendance",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updateAttendance(HttpServletResponse resp,Attendance attendance){
		System.out.println("++++++++++++++++++++++++++++++++++");
		System.out.println("+			修	师	校			 +");
		System.out.println("+				生	长			 +");
		System.out.println("+				考	权			 +");
		System.out.println("+			改	勤	限			 +");
		System.out.println("++++++++++++++++++++++++++++++++++");
		
		int update_db= attendanceService.updateAttendance(attendance);
		System.out.println("del返回值 ： "+update_db);
		//System.err.println("-----attendance---queryStudentAll()---concurrentMap：" + concurrentMap);
		return update_db+"";
		
	}*/
	
	
	
	
	
	
	
	/*================######=======================分页===================#####=============================*/
	@RequestMapping(value ="/query/AllByPage")
	@ResponseBody
	public ConcurrentMap<String, Object> queryAttendanceAllByPage(Attendance attendance,Page<Attendance> page,@RequestParam("limit") int limit){
		System.out.println("++++++++++++++++++++++++++++++++++");
		System.out.println("+		全		勤				 +");
		System.out.println("++++++++++++++++++++++++++++++++++");
		page.setT(attendance);
		page.setRows(limit);
		System.out.println("page++++++++++++"+page);
		List<Attendance>  attendanceAll_db= attendanceService.queryAttendanceAllByPage(page);
		System.out.println("attendanceAll_db++++++++++++++++"+attendanceAll_db);
		
		Integer queryCount_db = attendanceService.queryAttendanceCountByPage();
		System.out.println("queryCount_db++++++++++++++++"+queryCount_db);
		page.setTotalRecord(queryCount_db);
		System.out.println("page++加入条数++++++++++"+page);
		concurrentMap.put("count", queryCount_db);
		concurrentMap.put("data", attendanceAll_db);
		concurrentMap.put("code", 0);
		concurrentMap.put("msg", "成功");
		//System.err.println("-----attendance---queryAttendanceAll( )---concurrentMap：" + concurrentMap);
		return concurrentMap;
	}
	
	@RequestMapping(value ="/query/StudentAllPage")
	@ResponseBody
	public ConcurrentMap<String, Object> queryStudentAllByPage(Attendance attendance,Page<Attendance> page,@RequestParam("limit") int limit){
		System.out.println("++++++++++++++++++++++++++++++++++");
		System.out.println("+		查	学	生				 +");
		System.out.println("++++++++++++++++++++++++++++++++++");
		page.setRows(limit);
		List<Attendance>  attendanceAll_db= attendanceService.queryStudentByPageRid(page);
		System.out.println("attendanceAll_db+++++++学生+++++++++"+attendanceAll_db);
		Integer queryCountS_db = attendanceService.queryStudentCountByPageRid();
		System.out.println("queryCount_db++++++++++++++++"+queryCountS_db);
		page.setTotalRecord(queryCountS_db);
		
		concurrentMap.put("count", queryCountS_db);
		concurrentMap.put("data", attendanceAll_db);
		concurrentMap.put("code", 0);
		concurrentMap.put("msg", "成功");
		//System.err.println("-----attendance---queryStudentAll()---concurrentMap：" + concurrentMap);
		return concurrentMap;
	}
	
	@RequestMapping(value ="/query/TeacherAllPage")
	@ResponseBody
	public ConcurrentMap<String, Object> queryTeacherAllByPage(Attendance attendance,Page<Attendance> page,@RequestParam("limit") int limit ){
		System.out.println("++++++++++++++++++++++++++++++++++");
		System.out.println("+			讲		师			 +");
		System.out.println("++++++++++++++++++++++++++++++++++");
		
		page.setRows(limit);
		List<Attendance>  attendanceAll_db= attendanceService.queryTeacherByPageRid(page);
		System.out.println("attendanceAll_db+++++++讲师+++++++++"+attendanceAll_db);
		Integer queryCountT_db = attendanceService.queryTeacherCountByPageRid();
		System.out.println("queryCount_db++++++++++++++++"+queryCountT_db);
		page.setTotalRecord(queryCountT_db);
		
		concurrentMap.put("count", queryCountT_db);
		concurrentMap.put("data", attendanceAll_db);
		concurrentMap.put("code", 0);
		concurrentMap.put("msg", "成功");
		return concurrentMap;
		
	}
	//queryAttendanceAllByPageUid
	@RequestMapping(value ="/query/MyselfPage")
	@ResponseBody
	public ConcurrentMap<String, Object> queryMyselfPage(Attendance attendance,Page<Attendance> page,@RequestParam("limit") int limit ){
		System.out.println("++++++++++++++++++++++++++++++++++");
		System.out.println("+			自		己			 +");
		System.out.println("++++++++++++++++++++++++++++++++++");
		User user_session = (User) SecurityUtils.getSubject().getSession().getAttribute("user_session");
		String uId = user_session.getuId();
		attendance.setUser(user_session);
		page.setT(attendance);
		page.setRows(limit);
		List<Attendance>  attendanceAll_db= attendanceService.queryAttendanceAllByPageUid(page);
		System.out.println("attendanceAll_db+++++++讲师+++++++++"+attendanceAll_db);
		Integer queryCountT_db = attendanceService.queryAttendanceCountByPageUid(page);
		System.out.println("queryCount_db++++++++++++++++"+queryCountT_db);
		page.setTotalRecord(queryCountT_db);
		
		concurrentMap.put("count", queryCountT_db);
		concurrentMap.put("data", attendanceAll_db);
		concurrentMap.put("code", 0);
		concurrentMap.put("msg", "成功");
		return concurrentMap;
		
	}
}
