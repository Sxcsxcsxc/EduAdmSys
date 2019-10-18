package com.hqyj.EduAdmSystem.system.service;

import java.util.List;

import com.hqyj.EduAdmSystem.system.entity.User;
import com.hqyj.EduAdmSystem.system.entity.UserForCU;
import com.hqyj.EduAdmSystem.system.util.Page;

public interface UserService {
	public User findUserByName(String username);

	public Integer queryAllUserCountByRoleId(String roleId);

	public List<User> queryAllUserByRoleId(String roleId);

	public int deletUserByUserId(String uId);

	public User queryUserByUserId(String string);

	public int addUserByUserForCU(UserForCU userForCU_ui);

	public int updateUserByUserForCU(UserForCU userForCU_ui);

	public Integer queryAllUserCountByPage(Page<UserForCU> page);

	public List<UserForCU> queryAllUserListByPage(Page<UserForCU> page);

	public int queryUserByName(String uUsername);

}
