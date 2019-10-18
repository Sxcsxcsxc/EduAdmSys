package com.hqyj.EduAdmSystem.system.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("/gologin")
	public String gologin(){
		return "login";
	}
	/**
	 * 退出
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(){
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "login";
	}
	/**
	 * 登录
	 * @param username
	 * @param password
	 * @param request
	 * @return
	 */
	@RequestMapping("/login")
	public String login(String username,String password,HttpServletRequest request,HttpSession session){
		System.err.println("-----------------"+username);
		System.err.println("-------------------"+password);
		session.setAttribute("yes", "0");
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username,password);
		try {
			System.out.println("认证开始");
			subject.login(token);
			System.out.println("认证结束");
			System.out.println("--------subject.getSession()里的数据--------- : "+subject.getSession().getAttribute("user_session"));
			return "redirect:pageController/main";
		} catch (AuthenticationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.getSession().setAttribute("error","账号密码错误");
			return "login";
		}
		
	}
}
