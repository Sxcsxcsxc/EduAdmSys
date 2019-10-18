package com.hqyj.EduAdmSystem.system.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.EduAdmSystem.system.dao.RoleMapper;
import com.hqyj.EduAdmSystem.system.entity.Role;
import com.hqyj.EduAdmSystem.system.service.RoleService;
@Service
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleMapper rm;
	@Override
	public Role findRoleByRoleName(String rname) {
		Role r = rm.findRoleByRoleName(rname);
		return r;
	}

}
