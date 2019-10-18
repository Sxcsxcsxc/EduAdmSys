package com.hqyj.EduAdmSystem.system.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.EduAdmSystem.system.dao.UserMapper;
import com.hqyj.EduAdmSystem.system.entity.User;
import com.hqyj.EduAdmSystem.system.entity.UserForCU;
import com.hqyj.EduAdmSystem.system.service.UserService;
import com.hqyj.EduAdmSystem.system.util.Page;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper um;

	@Override
	public User findUserByName(String username) {
		User u = um.findUserByName(username);
		return u;
	}

	/**
	 * 通过角色id查询角色总数
	 *
	 */
	@Override
	public Integer queryAllUserCountByRoleId(String roleId) {
		Integer countByRoleId_db = null;
		if ("4".equals(roleId)) {
			return um.queryAllUserCountByRoleId(roleId);
		} else if ("3".equals(roleId) || "2".equals(roleId)) {
			// 需要查询角色2班主任和3讲师
			countByRoleId_db = um.queryAllUserCountByRoleId("2") + um.queryAllUserCountByRoleId("3");
		}
		return countByRoleId_db;
	}

	/**
	 * 通过角色id查询所有角色
	 */
	@Override
	public List<User> queryAllUserByRoleId(String roleId) {
		if ("4".equals(roleId)) {
			return um.queryAllUserByRoleId(roleId);
		} else if ("3".equals(roleId) || "2".equals(roleId)) {
			// 需要查询角色2班主任和3讲师
			List<User> list_role2 = um.queryAllUserByRoleId("2");
			List<User> list_role3 = um.queryAllUserByRoleId("3");
			list_role2.addAll(list_role3);
			return list_role2;
		}
		return null;
	}

	@Override
	public int deletUserByUserId(String uId) {
		// updateUserByUser
		// User queryUserByUserId_db = um.queryUserByUserId(uId);
		// User user_delet = user;
		UserForCU user_delet = new UserForCU();
		user_delet.setuId(uId);
		user_delet.setuState("0");
		// queryUserByUserId_db.setuState("0");
		return um.updateUserByUserForCU(user_delet);
	}

	@Override
	public User queryUserByUserId(String Uid) {
		return um.queryUserByUserId(Uid);
	}

	@Override
	public int addUserByUserForCU(UserForCU userForCU_ui) {
		return um.addUserByUserForCU(userForCU_ui);
	}

	@Override
	public int updateUserByUserForCU(UserForCU userForCU_ui) {
		return um.updateUserByUserForCU(userForCU_ui);
	}

	@Override
	public Integer queryAllUserCountByPage(Page<UserForCU> page) {
		return um.queryAllUserCountByPage(page);
	}

	@Override
	public List<UserForCU> queryAllUserListByPage(Page<UserForCU> page) {
		return um.queryAllUserListByPage(page);
	}

	@Override
	public int queryUserByName(String uUsername) {
		
		return um.queryUserByName(uUsername);
	}

}
