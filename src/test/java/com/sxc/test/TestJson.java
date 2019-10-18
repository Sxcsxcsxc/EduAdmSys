package com.sxc.test;

import java.util.ArrayList;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hqyj.EduAdmSystem.system.entity.User;

public class TestJson {
	public static void main(String[] args) {
//		ObjectMapper mapper = new ObjectMapper();  
//        try {
//            /** java对象转换为json字符串 */
//            User user = new User();
//            user.setuId("123");
//            user.setuPassword("123");
//            String d3 = mapper.writeValueAsString(user);
//            System.out.println(d3);
//
//        } catch (Exception e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
		
		ObjectMapper mapper = new ObjectMapper();  
        try {
            /** java对象转换为json字符串 */
            User user = new User();
            User user1 = new User();
            ArrayList<User> list = new ArrayList<>();
            user.setuId("1");
            user.setuPassword("123");
            user1.setuId("2");
            user1.setuRealname("leyer");
            list.add(user);
            list.add(user1);
            String user_json = mapper.writeValueAsString(list);
            System.err.println("'code':0,'msg':'','count':1000,'data':"+user_json);
//            return "{\"code\":0,\"msg\":\"\",\"count\":1000,\"data\":["+user_json+"]}";
        } catch (Exception e) {
            e.printStackTrace();
        }

	}
}
