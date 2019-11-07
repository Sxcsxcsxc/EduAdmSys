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
<title>欢迎登陆~</title>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css'
	rel='stylesheet'>
<link
	href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://www.layuicdn.com/layui/css/layui.css">
	<link rel="stylesheet" href="css/loginStyle.css">
</head>
<body>
	<div class="container">
		<div class="card-wrap">
			<div class="card border-0 shadow card--welcome is-show" id="welcome">
				<div class="card-body">
					<h2 class="card-title">欢迎光临</h2>
					<p>欢迎进入登录页面</p>
					<div class="btn-wrap">
						<a class="btn btn-lg btn-register js-btn" data-target="register">注册</a>
						<a class="btn btn-lg btn-login js-btn" data-target="login">登录</a>
						<p style="color: red">${error}</p>
					</div>
				</div>
			</div>

			<!-- 注册 -->
			<div class="card border-0 shadow card--register" id="register">
				<div class="card-body">
					<h2 class="card-title">学生注册</h2>
					<p class="card-text">第三方注册</p>
					<p class="badge-wrap">
						<a class="badge"><i class="fab fa-facebook-f"></i></a> <a
							class="badge"><i class="fab fa-google"></i></a> <a class="badge"><i
							class="fab fa-twitter"></i></a> <a class="badge"><i
							class="fab fa-github"></i></a>
					</p>
					<p>或者自行注册</p>
					<div class="layui-form">
						<div class="form-group">
							<input name="uUsername" class="form-control" type="text" placeholder="用户名不能全为数字"
								required="required" />
						</div>
						<div class="form-group">
							<input name="uRealname" class="form-control" type="text" placeholder="真实姓名（选填）"
								required="required" />
						</div>
						<div class="form-group">
							<input name="uPassword" class="form-control" type="password" placeholder="6到12位，不能出现空格"
								required="required" />
						</div>
						<div class="form-group">
							<input name="uPasswordSec" class="form-control" type="password" placeholder="确认密码"
								required="required" />
						</div>
						<button class="btn btn-lg" lay-submit lay-filter="formRegister">注册</button>
					</div>
				</div>
				<button class="btn btn-back js-btn" data-target="welcome">
					<i class="fas fa-angle-left"></i>
				</button>
			</div>

			<!-- 登录 -->
			<div class="card border-0 shadow card--login" id="login">
				<div class="card-body">
					<h2 class="card-title">欢迎登录！</h2>
					<p>第三方登录</p>
					<p class="badge-wrap">
						<a class="badge"><i class="fab fa-facebook-f"></i></a> <a
							class="badge"><i class="fab fa-google"></i></a> <a class="badge"><i
							class="fab fa-twitter"></i></a> <a class="badge"><i
							class="fab fa-github"></i></a>
					</p>
					<p>或用账号登录</p>
					<form action="<%=basePath%>login" method="post">
						<div class="form-group">
							<input name="username" class="form-control" type="text"
								placeholder="账号名" required="required" />
						</div>
						<div class="form-group">
							<input name="password" class="form-control" type="password"
								placeholder="密码" required="required" />
						</div>
						<p>
							<a href="#">忘记密码?</a>
						</p>
						<button class="btn btn-lg">登录</button>
					</form>
				</div>
				<button class="btn btn-back js-btn" data-target="welcome">
					<i class="fas fa-angle-left"></i>
				</button>
			</div>
		</div>
	</div>
	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://www.layuicdn.com/layui/layui.js"></script>
	<script src="js/login.js"></script>
	<script>
	//Demo
	layui.use('form', function(){
	  var form = layui.form;
	  var layer = layui.layer;
	//防止session过期，在iframe或者layui弹出层显示登陆界面
	$(document).ready(function () {  
	    if (window != top) {
	    	layer.msg("登陆信息已过期,将自动跳转到登陆界面~",{time : 3000,icon : 5,anim : 6,shade:  0.3,shadeClose:true})
            top.location.href = location.href;
        }
	}); 
	  //监听提交
	  form.on('submit(formRegister)', function(data){
	    //layer.msg(JSON.stringify(data.field));
	    var userForCU_ui = data.field;
	    //console.log(JSON.stringify(userForCU_ui));
		if(checkForm(userForCU_ui)){
			console.log("条件满足可以注册");
			$.ajax({
		        url: "<%=basePath%>user/add/addUserByUserForCU",
		        type: "POST",
		        //contentType:"application/json;charset=utf-8",
		        //data:{"user_ui":user_ui},
		        data: userForCU_ui,
		        dataType: "json",
		        success: function(data){
		           console.log(data);
		     	   if (data > 0){
		                layer.msg("注册成功~正在前往主页面", {icon: 6,time:5000},function(){
		                	$.post('<%=basePath%>login',{
								username : userForCU_ui.uUsername,
								password : userForCU_ui.uPasswordSec
							},function(data){
								location.href = '<%=basePath%>pageController/main';
							});
						});
					} else if(data == -99){
						layer.msg("注册失败，已存在该用户民请换一个哟~",{icon: 5,anim: 6,shade: 0.3,shadeClose:true});
					} else {
					 	layer.msg("添加失败，与服务器断开连接",{icon: 5 ,anim: 6,shade: 0.3,shadeClose:true});
					}
		        },
		    });
				
		}else{
			console.log("############条件不满足");
		}
	    return false;
	  });
	  
	  /* form表单数据合格验证 */
	  function checkForm(userForCU_ui){
		var uUsername = userForCU_ui.uUsername;
		var uRealname = userForCU_ui.uRealname;
	    var uPassword = userForCU_ui.uPassword;
	    var uPasswordSec = userForCU_ui.uPasswordSec;
		//var checkPass = /^[\S]{6,12}$/;
	    if(!/^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$/.test(uUsername)){
	      	layer.msg('用户名不能有特殊字符',{icon: 5 ,anim: 6,shade:  0.3,shadeClose:true});
	      	return false;
	    }
	    	
	   	if(/(^\_)|(\__)|(\_+$)/.test(uUsername)){
	  		layer.msg('用户名首尾不能出现下划线\'_\'',{icon: 5 ,anim: 6,shade:  0.3,shadeClose:true});
	  		return false;
		}
	   	
		if(/^\d+\d+\d$/.test(uUsername)){
		   	layer.msg('用户名不能全为数字',{icon: 5 ,anim: 6,shade:  0.3,shadeClose:true});
		   	return false;
	    }
	    
	    if(!/^[\S]{6,12}$/.test(uPassword)){
	    	console.log('密码格式不符合');
	        layer.msg('密码必须6到12位，且不能出现空格',{icon: 5 ,anim: 6,shade:  0.3,shadeClose:true});
	        return false;
	    }
	    
		if(uPassword != uPasswordSec){
			layer.msg('两次密码不一致，请重新输入',{icon: 5 ,anim: 6,shade:  0.3,shadeClose:true});
			return false;
		}
		
		if(uRealname == ''){
	      	return true;
	    }else if(!/^[\u4e00-\u9fa5]{2,30}$/.test(uRealname)){
	      	layer.msg('真实姓名不合法',{icon: 5 ,anim: 6,shade:  0.3,shadeClose:true});
	      	return false;
	    }
	  }
	});
	</script>
</body>
</html>