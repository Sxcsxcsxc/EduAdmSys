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

<div class="layadmin-tabsbody-item layui-show">
	<form class="layui-form layui-form-pane ">
		<div class="layui-form-item"> 
			<div class="layui-inline">
				<label class="layui-form-label">角色</label>
				<div class="layui-input-inline">
					<select id="roleId" name="roleId">
						<option value="">请选择角色</option>
						<option value="2">班主任</option>
						<option value="3">讲师</option>
						<option value="4">学生</option>
					</select>
				</div>
				
				<div class="layui-input-inline">
					<button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">立即修改</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		 </div>
	</form>
	</div>


<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script src="https://www.layuicdn.com/layui/layui.js"></script>
<script>


<%-- layer.open({
	  type: 2,
	  area: ['520px', '260px'],
	  title:'修改用户角色',
	  fixed: false, //不固定
	  maxmin: true,
	  anim: 1,
	  skin: 'layui-layer-lan',
	  shade: 0.3,
	  closeBtn: 2,
	  shadeClose: true,
	  content: ['<%=basePath%>pageController/editUserRole', 'no']
	}); --%>


<%-- var userForCU_ui = {
			uId : user.uId,
			roleId : 3
	};
	//向服务端发送删除指令
	$.ajax({
     url: "<%=basePath%>user/update/updateUserByUserForCU",
     type: "POST",
     data: userForCU_ui,
     dataType: "json",
     success: function(data){
         console.log(data);	
  	   if (data > 0) {
              //关闭提示框
              layer.close(index);
              layer.msg("修改角色成功", {icon: 6});
          	//前端修改这行数据
          	obj.update({
          		roleId: 3
			    });
			} else {
			 	layer.msg("修改角色成功",
			 		{icon: 5 
			 		,anim: 6}
			 	);
			}
     },
 }); --%>







//Demo
layui.use('form', function(){
  var form = layui.form;
  var layer = layui.layer;
  
  //监听提交
  form.on('submit(formDemo)', function(data){
	  var userForCU_ui = {
  			uId : user.uId,
  			roleId : 3
      	};
      	//向服务端发送删除指令
      	$.ajax({
           url: "<%=basePath%>user/update/updateUserByUserForCU",
           type: "POST",
           data: userForCU_ui,
           dataType: "json",
           success: function(data){
	           console.log(data);	
        	   if (data > 0) {
	                //关闭提示框
	                layer.close(index);
	                layer.msg("修改角色成功", {icon: 6});
	            	//前端修改这行数据
	            	obj.update({
	            		roleId: 3
				    });
				} else {
				 	layer.msg("修改角色成功",
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