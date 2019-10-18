package com.hqyj.EduAdmSystem.system.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hqyj.EduAdmSystem.system.dao.MenuMapper;
import com.hqyj.EduAdmSystem.system.entity.Menu;
import com.hqyj.EduAdmSystem.system.service.MenuService;
@Service
public class MenuServiceImpl implements MenuService{
	@Autowired
	private MenuMapper mm;
	@Override
	public List<Menu> findMenuAll() {
		List<Menu> menus = mm.findMenuAll();
		return menus;
	}

}
