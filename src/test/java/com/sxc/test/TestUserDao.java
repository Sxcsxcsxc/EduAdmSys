package com.sxc.test;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hqyj.EduAdmSystem.system.dao.UserMapper;

public class TestUserDao {
	@Autowired
	private static UserMapper um;

	public static void main(String[] args) {
//		System.out.println("123123");
//		User findUserByName = um.findUserByName("zs");
//		System.out.println(findUserByName);
//		Integer queryAllUserCountByRoleId = um.queryAllUserCountByRoleId("4");
//		System.out.println(queryAllUserCountByRoleId);
//		Integer i = new Integer(1);
//		Integer i1 = new Integer(2);
//		System.out.println(i+i1);
		
		
		List<String> list_a=new ArrayList<String>();
		list_a.add("A");
		list_a.add("B");
		list_a.add("C");
		list_a.add("D");
		//第二个list集合  
		List<String> list_b=new ArrayList<String>(); 
		list_b.add("C"); 
		list_b.add("D"); 
		list_b.add("E");
		list_b.add("F"); 
		list_b.add("G"); 
		//把第二个list集合添加到第一个list集合中  
		 list_a.addAll(list_b);
		 System.out.println(list_a);
	}
}
