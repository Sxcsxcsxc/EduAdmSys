<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>功能选择列表</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div style="height: 200px;"></div>
	<!-- 可删除 -->
	<div class="Service-box">
		<div class="Service-content clearfix">
			<a href="javascript:;" class="Service-item">
				<div class="item-image">
					<img src="<%=basePath%>imges/yonghu-xuanzhong.png" alt="">
				</div>
				<h3 class="item-title">查看所有用户</h3>
				<div class="item-text">将进入神秘的操作窗口</div> <span class="item-link">进入</span>
			</a>
			
			 <a href="<%=basePath%>menu/add" class="Service-item">
				<div class="item-image">
					<img src="<%=basePath%>imges/function.png" alt="">
				</div>
				<h3 class="item-title">添加</h3>
				<div class="item-text">功能介绍</div> <span class="item-link">进入</span>
			</a> 
			
			<a href="<%=basePath%>menu/delete" class="Service-item">
				<div class="item-image">
					<img src="<%=basePath%>imges/function.png" alt="">
				</div>
				<h3 class="item-title">删除</h3>
				<div class="item-text">功能介绍</div> <span class="item-link">进入</span>
			</a> 
			<!-- ############################################### -->
			
			
			
			<a href="<%=basePath%>logout" class="Service-item">
				<div class="item-image">
					<img src="<%=basePath%>imges/function.png" alt="">
				</div>
				<h3 class="item-title">退出</h3>
				<div class="item-text">功能介绍</div> <span class="item-link">进入</span>
			</a> 
			
			<a href="javascript:;" class="Service-item">
				<div class="item-image">
					<img src="<%=basePath%>imges/function.png" alt="">
				</div>
				<h3 class="item-title">功能1</h3>
				<div class="item-text">功能介绍</div> <span class="item-link">进入</span>
			</a>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
</body>
</html>