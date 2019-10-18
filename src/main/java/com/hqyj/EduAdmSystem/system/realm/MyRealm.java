package com.hqyj.EduAdmSystem.system.realm;

import java.util.HashSet;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.hqyj.EduAdmSystem.system.entity.Role;
import com.hqyj.EduAdmSystem.system.entity.User;
import com.hqyj.EduAdmSystem.system.service.UserService;


public class MyRealm extends AuthorizingRealm {
	@Autowired
	private UserService userService;
	
	/**
	 * 
	 * 授权方法
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// 1. 从PrincipalCollection中来获取登陆用户的信息(username)
		Object principal = principals.getPrimaryPrincipal();
		System.out.println("当前登陆的用户:"+principal);
		// 2. 利用登陆的用户信息来获取用户当前的角色以及权限(可能查询数据库)
		
		Set<String> set = new HashSet<String>();
//		查询user通过账号
		User user = userService.findUserByName((String)principal);
		System.out.println(user+"$$$$$$$$$$$$$$$$$$");
//		得到user对应的角色
		Role role = user.getRole();
//		角色名放入集合中
		set.add(role.getRname());
		
		System.out.println("set里的值:"+set);
		// 3. 创建SimpleAuthorizationInfo,并设置其reles属性
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
//		给当前用户添加角色
		simpleAuthorizationInfo.addRoles(set);
		// 4. 返回SimpleAuthorizationInfo对象
		return simpleAuthorizationInfo;
	}

	/**
	 * 认证方法
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		// TODO Auto-generated method stub
//		从token中拿到username
		String userName = (String) token.getPrincipal();
//		通过username去数据库里面查询
		User user = userService.findUserByName(userName);
		System.out.println(user);
		/*User user = userService.findUser(userName);
		System.out.println(user);*/
		
		Subject currentUser = SecurityUtils.getSubject();
//		获取session
		Session session = currentUser.getSession();
//		将登录账号放入session(作用与servlet中的session是一样的)
		session.setAttribute("user_session", user); 
		/*session.setAttribute("userName", userName);
		session.setAttribute("headImg", user.getHeadImg());*/
		
		// 获取盐，通常用账号
		ByteSource credentialsSalt = ByteSource.Util.bytes(userName);
		System.out.println(credentialsSalt+"xxxxxxxxxxxxxxxxxxxxxxxxxx");
		// 盐值加密（传入四个参数：账号，密码，盐，数据源的名字）
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(userName,user.getuPassword(),credentialsSalt,getName());
		System.out.println(getName()+"xxxxxxxxxxxxxxxxxxxxxxxxxxx");
		// SimpleAuthenticationInfo simpleAuthenticationInfo = new
		// SimpleAuthenticationInfo(user,
		// "64c8b1e43d8ba3115ab40bcea57f010b",getName());
		
		return simpleAuthenticationInfo;
	}

}
