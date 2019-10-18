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
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.layuicdn.com/layui/css/layui.css">

</head>
<body>
<div class="layui-body" style="left: 150px;">
	<!-- <div class="layadmin-tabsbody-item layui-show">
		<div class="layui-fluid"> -->
			<div class="layui-card">
				<div class="layui-form layui-card-header layuiadmin-card-header-auto">

				</div>
				<div class="layui-card-body">
					<form class="layui-form layui-form-pane" action="<%=basePath%>user/add/addUserByUser">
						<div class="layui-form-item">
							<label class="layui-form-label">用户名：</label>
							<div class="layui-input-inline">
								<input type="text" name="uUsername" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
								 class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">密码：</label>
							<div class="layui-input-inline">
								<input type="text" name="uPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
								 class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux">六位密码哟~</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">真实姓名：</label>
							<div class="layui-input-inline">
								<input type="text" name="uRealname" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
								 class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">角色选择：</label>
							<div class="layui-input-inline">
								<select name="roleId" lay-verify="required">
									<option value=""></option>
									<option value="2">班主任</option>
									<option value="3">讲师</option>
									<option value="4" selected="selected">学生</option>
								</select>
							</div>
							<div class="layui-form-mid layui-word-aux">默认是学生哟~</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">激活状态</label>
							<div class="layui-input-block">
								<input type="checkbox" name="uState" value="1" lay-skin="switch" checked>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">立即提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>
				</div>
		<!-- 	</div>
		</div> -->
	</div>
</div>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script src="https://www.layuicdn.com/layui/layui.js"></script>
<script>
//Demo
layui.use('form', function(){
  var form = layui.form;
  var layer = layui.layer;
  
  //监听提交
  form.on('submit(formDemo)', function(data){
    //layer.msg(JSON.stringify(data.field));
    var userForCU_ui = data.field;
    console.log(JSON.stringify(userForCU_ui));
    $.ajax({
        url: "<%=basePath%>user/add/addUserByUserForCU",
        type: "POST",
        //contentType:"application/json;charset=utf-8",
        //data:{"user_ui":user_ui},
        data: userForCU_ui,
        dataType: "json",
        success: function(data){
           console.log(data);
     	   if (data > 0) {
                //关闭删除框
                //layer.close(index);
                layer.msg("添加成功", {icon: 6});
			} else if(data == -99){
				layer.msg("添加失败，已存在该用户民请换一个哟~",
				 		{icon: 5 
				 		,anim: 6}
				 	);
				} else {
				 	layer.msg("添加失败，与服务器断开连接",
				 		{icon: 5 
				 		,anim: 6}
				 	);
				}
        },
    });
    return false;
  });
});
</script>
</body>
</html>