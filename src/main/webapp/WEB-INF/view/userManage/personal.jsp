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
<title>个人资料</title>
<link rel="stylesheet" href="https://www.layuicdn.com/layui/css/layui.css">
</head>
<body style="background-color: rgb(242,242,242);">
<div id="LAY_app_body" >
	<div class="layadmin-tabsbody-item layui-show">
		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md12">
					<div class="layui-card">
						<div class="layui-card-header">设置我的资料</div>
						<div class="layui-card-body" pad15="">
							<form class="layui-form" lay-filter="" action="">
								<!-- <div class="layui-form-item"> <label class="layui-form-label">我的角色</label> <div class="layui-input-inline"> <select name="role" lay-verify=""> <option value="1" selected="">超级管理员</option> <option value="2" disabled="">普通管理员</option> <option value="3" disabled="">审核员</option> <option value="4" disabled="">编辑人员</option> </select> <div class="layui-unselect layui-form-select"> <div class="layui-select-title"><input type="text" placeholder="请选择" value="超级管理员" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div> <dl class="layui-anim layui-anim-upbit"> <dd lay-value="1" class="layui-this">超级管理员</dd> <dd lay-value="2" class=" layui-disabled">普通管理员</dd> <dd lay-value="3" class=" layui-disabled">审核员</dd> <dd lay-value="4" class=" layui-disabled">编辑人员</dd> </dl> </div> </div> <div class="layui-form-mid layui-word-aux">当前角色不可更改为其它角色</div> </div> -->
								<div class="layui-form-item">
									<label class="layui-form-label">账号名</label>
									<div class="layui-input-inline">
										<input type="text" name="uUsername" value="${user_session.uUsername }" disabled  lay-verify="uUsername" placeholder="请输入账号名" class="layui-input layui-disabled">
									</div>
									<div class="layui-form-mid layui-word-aux">不可修改。一般用于后台登入名，如需修改~请联系管理员修改</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">真实姓名</label>
									<div class="layui-input-inline">
										<input type="text" name="uRealname" value="${user_session.uRealname }" autocomplete="off" placeholder="请输入真实姓名"
										 class="layui-input" lay-verify="required" >
									</div>
									<div class="layui-form-mid layui-word-aux">请输入真实的姓名</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">密码</label>
									<div class="layui-input-inline">
										<input type="password" name="uRealPW" value="${user_session.uRealPW }" lay-verify="pass" autocomplete="off" placeholder="请输入修改的密码"
										 class="layui-input">
									</div>
									<div class="layui-form-mid layui-word-aux">请输入6到12位密码哟~不能有空格</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">确认密码</label>
									<div class="layui-input-inline">
										<input type="password" id="uPasswordSec" name="uPasswordSec" value="" lay-verify="pass" autocomplete="off" placeholder="请确认刚才输入的密码"
										 class="layui-input">
									</div>
									<div class="layui-form-mid layui-word-aux">请输入6到12位密码哟~不能有空格</div>
								</div>
								
								<!-- 当前用户的uId -->
								<input type="hidden" name="uId" value="${user_session.uId }">
								 <div class="layui-form-item">
									<label class="layui-form-label">激活状态</label>
									<div class="layui-input-block">
										<input  type="checkbox" name="" value="${user_session.uState }" lay-skin="switch" class="layui-input layui-disabled" checked disabled>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">头像</label>
									<div class="layui-input-inline">
										<input name="" lay-verify="required" id="LAY_avatarSrc" placeholder="图片地址" value="http://cdn.layui.com/avatar/168.jpg"
										 class="layui-input">
									</div>
									<div class="layui-input-inline layui-btn-container" style="width: auto;">
										<button type="button" class="layui-btn layui-btn-primary" id="LAY_avatarUpload">
											<i class="layui-icon"></i>上传图片
										</button>
										<input class="layui-upload-file" type="file" accept="undefined" name="">
										<button class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button>
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn" lay-submit lay-filter="setmyinfo">确认修改</button>
										<button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>
	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://www.layuicdn.com/layui/layui.js"></script>
	<script>
		//layui.use('set', layui.factory('set'));
		layui.use('form', function(){
		  var form = layui.form;
		  var layer = layui.layer;
		  
		  form.verify({
			  username: function(value, item){ //value：表单的值、item：表单的DOM对象
				if(!/^[\u4e00-\u9fa5]{2,30}$/.test(value)){
		      		return '真实姓名不合法';
			    }
				if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
			      	return '用户名不能有特殊字符';
			    }
			    if(/(^\_)|(\__)|(\_+$)/.test(value)){
			      return '用户名首尾不能出现下划线\'_\'';
			    }
			    if(/^\d+\d+\d$/.test(value)){
			      return '用户名不能全为数字';
			    }
			    
			  }
			  
			  //我们既支持上述函数式的方式，也支持下述数组的形式
			  //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
			  ,pass: [
			    /^[\S]{6,12}$/
			    ,'密码必须6到12位，且不能出现空格'
			  ] 
			});
		  
		  //监听提交
		  form.on('submit(setmyinfo)', function(data){
		    //layer.msg(JSON.stringify(data.field));
		    var userForCU_ui=data.field;
		    console.log(JSON.stringify(userForCU_ui));
		    uPasswordSec = userForCU_ui.uPasswordSec;
		    uRealPW = userForCU_ui.uRealPW;
		    
		    if(uPasswordSec != uRealPW){
		    	layer.msg("两次密码输入不一致请重新输入",
				 		{icon: 5 
				 		,anim: 6}
				 	);
		    }else{
		    $.ajax({
		        url: "<%=basePath%>user/update/updateUserByUserForCU",
		        type: "POST",
		        //contentType:"application/json;charset=utf-8",
		        //data:{"user_ui":user_ui},
		        data: userForCU_ui,
		        dataType: "json",
		        success: function(data){
		           console.log(data);
		     	   if (data > 0) {
		                layer.msg("修改成功", {icon: 6});
					} else {
					 	layer.msg("修改失败",
					 		{icon: 5 
					 		,anim: 6}
					 	);
					}
		        },
		    });
		    }
		    return false;
		  });
		  
		});
		
		
	</script>
</body>
</html>