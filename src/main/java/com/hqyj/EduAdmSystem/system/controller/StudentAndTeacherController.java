package com.hqyj.EduAdmSystem.system.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hqyj.EduAdmSystem.system.entity.User;
import com.hqyj.EduAdmSystem.system.entity.UserForCU;
import com.hqyj.EduAdmSystem.system.util.Page;

import frame.utils.CreatMd5Pwd;
import frame.utils.PrimaryKeyUtil;

@Controller
@RequestMapping("/user")
public class StudentAndTeacherController extends BaseController {
	private static ConcurrentMap<String, Object> concurrentMap = new ConcurrentHashMap<String, Object>();

	@RequestMapping("/query/studentScore")
	public String queryStuScore() {

		return "stuScore";
	}

	@RequestMapping("/query/allTeacher")
	public String queryTeacherAll(HttpServletRequest request) {
		return "teacherall";
	}

	@RequestMapping("/add/studentScore")
	public String addStuScore() {
		return "addStuScore";
	}

	@RequestMapping("/update/studentScore")
	public String updateStuScore() {
		return "updateStuScore";
	}

	@RequestMapping("/add/teacher")
	public String addTeacher() {
		return "addTeacher";
	}

	/**
	 * <p>
	 * 通过用户角色id查询所有用户
	 * </p>
	 * 
	 * @author sxc
	 * @Date 2019年10月11日
	 * @param roleId
	 * @return
	 */
	@RequestMapping("/query/queryList")
	@ResponseBody
	public ConcurrentMap<String, Object> queryAllUserList(String roleId) {
		Integer queryCount_db = userService.queryAllUserCountByRoleId(roleId);
		System.err.println("-----user---1-----queryAllUserList()---queryCount：" + queryCount_db);
		List<User> userList_db = userService.queryAllUserByRoleId(roleId);
		concurrentMap.put("count", queryCount_db);
		concurrentMap.put("data", userList_db);
		concurrentMap.put("code", 0);
		concurrentMap.put("msg", "成功");
		System.err.println("-----user---2---queryAllUserList()---concurrentMap：" + concurrentMap);
		return concurrentMap;
	}

	/**
	 * <p>
	 * 通过用户角色id分页查询用户
	 * </p>
	 * 
	 * @author sxc
	 * @Date 2019年10月11日
	 * @param roleId
	 * @return
	 */
	@RequestMapping("/query/queryAllUserListByPage")
	@ResponseBody
	public ConcurrentMap<String, Object> queryAllUserListByPage(UserForCU userForCU, Page<UserForCU> page,
			@RequestParam("limit") int limit) {
		// system模块的com.hqyj.EduAdmSystem.system.util.Page
		// 维护前端传过来的数据
		System.err.println("-----page----------" + page);
		System.err.println("---------------" + userForCU);
		page.setT(userForCU);
		page.setRows(limit);
		System.err.println("-----user---传进分页查询的page-----queryAllUserListByPage()---page：" + page);
		// System.err.println("-----user--------queryAllUserListByPage()---page："+
		// page.getT().getRoleId());
		List<UserForCU> userList_db = userService.queryAllUserListByPage(page);
		System.err.println("-----user--------queryAllUserListByPage()---userList_db：" + userList_db);

		Integer queryCount_db = userService.queryAllUserCountByPage(page);
		System.err.println("-----user--------queryAllUserListByPage()---queryCount：" + queryCount_db);
		page.setTotalRecord(queryCount_db);
		System.err.println("-----user---维护好的page-----queryAllUserListByPage()---page：" + page);

		concurrentMap.put("count", queryCount_db);
		concurrentMap.put("data", userList_db);
		concurrentMap.put("code", 0);
		concurrentMap.put("msg", "成功");
		System.err.println("-----user---2---queryAllUserListByPage()---concurrentMap：" + concurrentMap);
		return concurrentMap;
	}

	/**
	 * <p>
	 * 通过用户id删除该用户（假删除）后端仅更新uState为0就行了
	 * </p>
	 * 
	 * @author sxc
	 * @Date 2019年10月12日
	 * @param uId
	 * @return
	 */
	@RequestMapping("delete/deletUserByUserForCUId")
	@ResponseBody
	public int deletUserByUserForCUId(String uId, String[] userForCUListId) {
		// @RequestParam(value="userForCUList")
		int count = 0;
		System.err.println("-----user------deletUserByUserForCUId()---userForCUListId：" + userForCUListId);
		System.err.println("-----user--------deletUserByUserForCUId()---uId：" + uId);
		if (uId == null) {
			for (String userForCUId : userForCUListId) {
				System.err.println(userForCUId);
				count = userService.deletUserByUserId(userForCUId);
				if (count > 1) {
					count++;
				}
				System.err.println("-----user----用户id集合----deletUserByUserForCUId()---count：" + count);
			}
		} else if (userForCUListId == null) {
			count = userService.deletUserByUserId(uId);
			System.err.println("-----user----单个用户----deletUserByUserForCUId()---count：" + count);
		}

		return count;
	}

	@RequestMapping("/update/updateUserByUserForCU")
	@ResponseBody
	public int updateUserByUserForCU(UserForCU userForCU_ui, String[] userForCUListId) {
		int count = 0;
		System.err.println("-----user----updateUserByUserForCU()-------userForCUListId：" + userForCUListId);
		System.err.println("-----user----updateUserByUserForCU()----0---userForCU_ui：" + userForCU_ui);
		/*int queryUserByNameCount = userService.queryUserByName(userForCU_ui.getuUsername());
		if(queryUserByNameCount == 0){
		}else{
			count = -99;
			System.err.println("该用户已存在不可修改");
		}*/
		System.err.println("该用户名可以修改");
		// 维护用户数据
//		userForCU_ui.setuRealPW(userForCU_ui.getuPassword());
		if (userForCU_ui.getuState() == null && userForCU_ui.getRoleId() == null) {
			System.err.println("-----user----updateUserByUserForCU()---修改账号的基本信息---");
			String getMd5Pwd = CreatMd5Pwd.GetMd5Pwd(userForCU_ui.getuUsername(), userForCU_ui.getuRealPW());
			userForCU_ui.setuPassword(getMd5Pwd);
			System.err.println("-----user----updateUserByUserForCU()----维护好的用户数据---userForCU_ui：" + userForCU_ui);
		}
		count = userService.updateUserByUserForCU(userForCU_ui);
		return count;
	}

	@RequestMapping("add/addUserByUserForCU")
	@ResponseBody
	public int addUserByUserForCU(UserForCU userForCU_ui) {
		int count = 0;
		System.err.println("-----user----addUserByUserForCU()----前端传进来的初始数据---userForCU_ui：" + userForCU_ui);
		//判断是否存在该用户名
		int queryUserByNameCount = userService.queryUserByName(userForCU_ui.getuUsername());
		if(queryUserByNameCount == 0){
			System.err.println("该用户可以注册或添加");
			// 维护用户数据
			// 设置真实密码
			userForCU_ui.setuRealPW(userForCU_ui.getuPassword());

			userForCU_ui.setuId(PrimaryKeyUtil.getPrimaryKey());
			String getMd5Pwd = CreatMd5Pwd.GetMd5Pwd(userForCU_ui.getuUsername(), userForCU_ui.getuRealPW());
			// 密文密码
			userForCU_ui.setuPassword(getMd5Pwd);
			if (userForCU_ui.getuState() == null) {
				userForCU_ui.setuState("1");
			}
			if (userForCU_ui.getRoleId() == null) {
				//用于学生注册的时候设置角色id
				userForCU_ui.setRoleId("4");
			}
			System.err.println("-----user----addUserByUserForCU()----维护好的用户数据---userForCU_ui：" + userForCU_ui);
			count = userService.addUserByUserForCU(userForCU_ui);
		}else{
			count = -99;
			System.err.println("该用户已存在不可注册");
		}
		System.err.println("count"+count);
		return count;
	}

	@RequestMapping("/query/queryAllTest")
	@ResponseBody
	public ConcurrentMap<String, Object> queryAllTest() {
		// Integer queryCount = buildService.queryCount();

		User user = new User();
		User user1 = new User();
		List<User> list = new ArrayList<>();
		user.setuId("1");
		user.setuPassword("123");
		user.setuRealname("ui");
		user1.setuId("2");
		user1.setuRealname("leyer");
		list.add(user);
		list.add(user1);
		// List<Building> building = buildService.queryAll();
		concurrentMap.put("count", 1000);
		concurrentMap.put("data", list);
		concurrentMap.put("code", 0);
		concurrentMap.put("msg", "成功");
		System.err.println("-----user--------queryAllTest()" + concurrentMap);
		return concurrentMap;

		// ObjectMapper mapper = new ObjectMapper();
		// try {
		// /** java对象转换为json字符串 */
		//

		// User user = new User();
		// User user1 = new User();
		// List<User> list = new ArrayList<>();
		// user.setuId("1");
		// user.setuPassword("123");
		// user1.setuId("2");
		// user1.setuRealname("leyer");
		// list.add(user);
		// list.add(user1);
		// String user_json = mapper.writeValueAsString(list);
		// System.err.println("----------user_json-----------------"+user_json);
		// System.err.println("{\"code\":0,\"msg\":\"\",\"count\":1000,\"data\":"+user_json+"}");
		// return
		// "{\"code\":0,\"msg\":\"\",\"count\":1000,\"data\":"+user_json+"}";
		//// return
		// "{\"code\":0,\"msg\":\"\",\"count\":1000,\"data\":"+user_json+"}";
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		//
	}
}
