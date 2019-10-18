<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>后台管理首页</title>
<link rel="stylesheet"
	href="https://www.layuicdn.com/layui/css/layui.css">
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">EduAdmSys教务系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="javascript:;">控制台</a></li>
				<!-- <li class="layui-nav-item"><a href="">商品管理</a></li> -->
				<shiro:hasAnyRoles name="超级管理员">
					<li class="layui-nav-item ">
						<a href="<%=basePath%>pageController/queryAllUserListByPage" target="iframe_part">用户管理</a>
					</li>
				</shiro:hasAnyRoles>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;">邮件管理</a>
						</dd>
						<dd>
							<a href="javascript:;">消息管理</a>
						</dd>
						<dd>
							<a href="javascript:;">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item">
				<a href="javascript:;"> 
					<img src="<%=basePath%>/imges/yonghu-xuanzhong.png"class="layui-nav-img">
					 ${user_session.uRealname}(${user_session.role.rname })
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="<%=basePath%>pageController/personal" target="iframe_part">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="logout">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<shiro:hasAnyRoles name="超级管理员,班主任,讲师,学生">
						<li class="layui-nav-item layui-nav-itemed"><a class=""
							href="javascript:;" style="font-weight: bold;">学生管理</a>
							<dl class="layui-nav-child">
								<%-- <shiro:hasAnyRoles name="超级管理员,班主任,讲师,学生">
									<dd>
										<a class="a_ifram" href="" target="iframe_part">学生信息中心</a>
									</dd>
								</shiro:hasAnyRoles> --%>
								<shiro:hasAnyRoles name="超级管理员,班主任,讲师">
									<dd>
										<a class="a_ifram" href="<%=basePath%>pageController/userList?roleId=4&choose=2" target="iframe_part">学生成绩管理</a>
									</dd>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="学生">
									<dd>
										<a class="a_ifram" href="<%=basePath%>pageController/attendanceListMyself" target="iframe_part">我的考勤信息</a>
									</dd>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="超级管理员,班主任">
									<dd>
										<a class="a_ifram" href="<%=basePath%>pageController/attendanceListStudentAllC" target="iframe_part">学生考勤信息</a>
									</dd>
								</shiro:hasAnyRoles>
								<!-- 测试超级管理员 -->
								<shiro:hasAnyRoles name="学生">
									<dd>
										<a class="a_ifram" href="<%=basePath%>gradeController/queryOneGradeByUserId?uId=${user_session.uId}" target="iframe_part">个人成绩查看</a>
									</dd>
								</shiro:hasAnyRoles>
							</dl></li>
					</shiro:hasAnyRoles>

					<!--  -->
					<shiro:hasAnyRoles name="超级管理员,班主任,讲师">
						<li class="layui-nav-item"><a href="javascript:;"
							style="font-weight: bold;">教师管理</a>
							<dl class="layui-nav-child">
								<%-- <shiro:hasAnyRoles name="超级管理员,班主任,讲师">
									<dd>
										<a class="a_ifram" href="" target="iframe_part">教师信息中心</a>
									</dd>
								</shiro:hasAnyRoles> --%>
								<shiro:hasAnyRoles name="超级管理员,班主任">
									<dd>
										<a class="a_ifram" href="<%=basePath%>pageController/attendanceListTeacherAllC" target="iframe_part">教师考勤信息</a>
									</dd>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="班主任,讲师">
									<dd>
										<a class="a_ifram" href="<%=basePath%>pageController/attendanceListMyself" target="iframe_part">我的考勤信息</a>
									</dd>
								</shiro:hasAnyRoles>
							</dl></li>
					</shiro:hasAnyRoles>
					
					<!--  -->
					<shiro:hasAnyRoles name="超级管理员,班主任">
						<li class="layui-nav-item"><a href="javascript:;"
							style="font-weight: bold;">考勤管理</a>
							<dl class="layui-nav-child">
								<shiro:hasAnyRoles name="超级管理员,班主任">
									<dd>
										<a class="a_ifram" href="<%=basePath%>pageController/attendanceListStudentAll" target="iframe_part">学生考勤管理</a>
									</dd>
								</shiro:hasAnyRoles>
								
								<shiro:hasAnyRoles name="超级管理员">
									<dd>
										<a class="a_ifram" href="<%=basePath%>pageController/attendanceListTeacherAll" target="iframe_part">教师考勤管理</a>
									</dd>
								</shiro:hasAnyRoles>
								<!-- 此处的超级管理员为测试时候用的，方便开发 -->
								<shiro:hasAnyRoles name="超级管理员">
									<dd>
										<a class="a_ifram" href="<%=basePath%>pageController/attendanceList" target="iframe_part">师生考勤管理测试</a>
									</dd>
								</shiro:hasAnyRoles>
							</dl></li>
					</shiro:hasAnyRoles>
					
					<!--  -->
					<shiro:hasAnyRoles name="超级管理员,班主任,讲师,学生">
						<li class="layui-nav-item"><a href="javascript:;"
							style="font-weight: bold;">教室安排</a>
							<dl class="layui-nav-child">
								<shiro:hasAnyRoles name="超级管理员,班主任,讲师,学生">
									<dd>
										<a class="a_ifram" href="<%=basePath%>pageController/classroomList" target="iframe_part">教室信息中心</a>
									</dd>
								</shiro:hasAnyRoles>
								<!-- 此处的超级管理员为测试时候用的，方便开发 -->
								<shiro:hasAnyRoles name="学生">
									<dd>
										<a class="a_ifram" href="<%=basePath%>pageController/userClassroom" target="iframe_part">查看我的教室</a>
									</dd>
								</shiro:hasAnyRoles>
							</dl></li>
					</shiro:hasAnyRoles>

					<!--  -->
					<shiro:hasAnyRoles name="学生">
						<li class="layui-nav-item" style="font-weight: bold;"><a
							href="javascript:;">课程中心</a>
							<dl class="layui-nav-child">
								<shiro:hasAnyRoles name="学生">
									<dd>
										<a class="a_ifram" href="<%=basePath%>scheduleController/queryCourseAll" target="iframe_part">选课界面</a>
									</dd>
								</shiro:hasAnyRoles>
								<shiro:hasAnyRoles name="学生">
									<dd>
										<a class="a_ifram" href="<%=basePath%>scheduleController/queryCourseWeek?Uid=${user_session.uId}" target="iframe_part">查看课表</a>
									</dd>
								</shiro:hasAnyRoles>
							</dl></li>
					</shiro:hasAnyRoles>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<iframe height="100%" width="100%" name="iframe_part" src="<%=basePath%>pageController/personal"></iframe>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© EduAdmSys.com - 教务管理系统
		</div>
	</div>
	<script src="https://www.layuicdn.com/layui/layui.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
	</script>
</body>
</html>