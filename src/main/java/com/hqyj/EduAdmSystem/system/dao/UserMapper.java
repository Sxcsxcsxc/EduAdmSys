package com.hqyj.EduAdmSystem.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hqyj.EduAdmSystem.system.entity.User;
import com.hqyj.EduAdmSystem.system.entity.UserForCU;
import com.hqyj.EduAdmSystem.system.util.Page;

@Repository
public interface UserMapper {
	public User findUserByName(String username);

	public Integer queryAllUserCountByRoleId(String roleId);

	public List<User> queryAllUserByRoleId(String roleId);

	public int deletUserByUserId(String uId);

	public User queryUserByUserId(String uid);

	public int updateUserByUserForCU(UserForCU queryUserByUserId_db);

	public int addUserByUserForCU(UserForCU userForCU_ui);

	public Integer queryAllUserCountByPage(Page<UserForCU> page);

	public List<UserForCU> queryAllUserListByPage(Page<UserForCU> page);

	public int queryUserByName(String uUsername);

}
