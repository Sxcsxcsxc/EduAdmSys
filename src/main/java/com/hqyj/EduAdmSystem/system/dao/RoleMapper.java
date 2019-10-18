package com.hqyj.EduAdmSystem.system.dao;

import org.springframework.stereotype.Repository;

import com.hqyj.EduAdmSystem.system.entity.Role;

@Repository
public interface RoleMapper {
	public Role findRoleByRoleName(String rname);
}
