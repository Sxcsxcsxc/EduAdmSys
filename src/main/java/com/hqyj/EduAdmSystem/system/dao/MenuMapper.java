package com.hqyj.EduAdmSystem.system.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hqyj.EduAdmSystem.system.entity.Menu;

@Repository
public interface MenuMapper {
	List<Menu> findMenuAll();
}
