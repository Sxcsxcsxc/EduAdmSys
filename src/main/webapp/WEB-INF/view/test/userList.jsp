<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String roleId = request.getParameter("roleId");
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta charset="utf-8">
<title>layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="https://www.layuicdn.com/layui/css/layui.css">
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body class="layui-body" style="left: 0px; background-color: rgb(242,242,242);">
<div>
	<div class="layadmin-tabsbody-item layui-show">
		<div class="layui-fluid" style="margin-top: 17px;">
			<div class="layui-card">
				<!-- 模糊查询&条件查询 -->
				<form action="" style="height: 74px;" class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="app-content-list">
				<div class="layui-form-item" style="padding-top: 15px; padding-bottom: 15px;">
					<div class="layui-inline">
						<label class="layui-form-label">用户名：</label>
						<div class="layui-input-inline">
							<input type="text" name="id" placeholder="请输入" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">真实姓名</label>
						<div class="layui-input-inline">
							<input type="text" name="author" placeholder="请输入" autocomplete="off" class="layui-input">
						</div>
					</div>
					
					<div class="layui-inline">
						<label class="layui-form-label">角色</label>
						<div class="layui-input-inline">
							<select name="label">
								<option value="">请选择标签</option>
								<option value="2">班主任</option>
								<option value="3">讲师</option>
								<option value="4">学生</option>
							</select>
						</div>
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">激活状态</label>
						<div class="layui-input-inline">
							<select name="label">
								<option value="">请选择标签</option>
								<option value="0">锁定</option>
								<option value="1">激活</option>
							</select>
						</div>
					</div>
					<div class="layui-inline">
						<button class="layui-btn layuiadmin-btn-list" lay-submit="" lay-filter="LAY-app-contlist-search">
							<i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
						</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
			<!-- userList -->
			<div class="layui-card-body">
				<table class="layui-hide" id="test" lay-filter="test"></table>
			</div>
		</div>
		</div>
	</div>
</div>

	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
	<button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="addUser">添加一个用户</button>
  </div>
</script>

	<script type="text/html" id="barDemo">
  	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
  	<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="editRole">修改用户角色</a>
	</script>
	
	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://www.layuicdn.com/layui/layui.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
   //,url:'table/demo1.json'
    	
  ,url:"<%=basePath%>user/query/queryList?roleId=${roleId}"
    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
      title: '提示'
      ,layEvent: 'LAYTABLE_TIPS'
      ,icon: 'layui-icon-tips'
    }]
    ,page: true //true表示分页
    ,limit: 10 //显示的几条数据
    ,title: '用户基本数据表'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'uId', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
      ,{field:'uUsername', title:'用户名(可修改)', width:130, edit: 'text'}
      ,{field:'uPassword', title:'密码(可修改)', width:130, edit: 'text'}
      ,{field:'uRealname', title:'真实姓名(可修改)', width:140, edit: 'text'}
      ,{field:'role', title:'角色', width:80, templet:'#roleName'}
      ,{field:'uState', title:'状态', width:80, unresize: true, sort: true}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo',width:240}
    ]]
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'getCheckData':
        var data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选');
      case 'addUser':
    	  layer.open({
    		  type: 2,
    		  area: ['700px', '450px'],
    		  title:'添加用户',
    		  fixed: false, //不固定
    		  maxmin: true,
    		  anim: 1,
    		  skin: 'layui-layer-lan',
    		  shade: 0.3,
    		  closeBtn: 2,
    		  shadeClose: true,
    		  content: ['<%=basePath%>pageController/addUserByUser', 'no']
    		});
    	  
      break;
      
      //自定义头工具栏右侧图标 - 提示
      case 'LAYTABLE_TIPS':
        layer.alert('这是工具栏右侧自定义的一个图标按钮');
      break;
    };
  });
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    //获得每一行的数据对象
  	var user = obj.data;
    //console.log(data)
    //console.log(user.uId)
    //console.log(JSON.stringify(user));
    if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
      	//向服务端发送删除指令
      	$.ajax({
           url: "<%=basePath%>user/delete/deletUserByUserForCUId",
           type: "POST",
           data:{"uId":user.uId},
           dataType: "json",
           success: function(data){
	           console.log(data);	
        	   if (data > 0) {
	            	//前端删除这行数据
	           		obj.del();
	                //关闭删除框
	                layer.close(index);
	                layer.msg("删除成功", {icon: 6});
				} else {
				 	layer.msg("删除失败",
				 		{icon: 5 
				 		,anim: 6}
				 	);
				}
           },
       });
      	//可以封装一个ajax请求的方法来想服务器发送删除选中数据的请求
      	//layer.close(index);需要在ajax里成功了之后才关闭，
      	//https://blog.csdn.net/weixin_39220472/article/details/80663592
      });
    } else if(obj.event === 'edit'){
    	/* 修改用户信息功能 */
    	//var userForCU_ui= user;
    	layer.prompt({
        formType: 2
        ,value: '用户id：'+user.uId+'\n用户名:'+user.uUsername+'\n密码：'+user.uPassword + '\n真实姓名：'+ user.uRealname
      }, function(value, index){
    	  var userForCU_ui={
    		uId : user.uId,
    		uUsername : user.uUsername,
    		uPassword : user.uPassword,
    		uRealname : user.uRealname 
    	  }
    	  console.log('userForCU_ui----edit---'+JSON.stringify(userForCU_ui));
    	  /* {"uId":"","uUsername":"123","uPassword":"","uRealname":"111","uState":"1",
    		  "role":{"rid":4,"rname":"学生","menus":null}} */
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
   	                layer.close(index);
   	                layer.msg("修改成功", {icon: 6});
   				} else if(data == -99){
					layer.msg("修改失败，已存在该用户民请换一个哟~",
				 		{icon: 5 
				 		,anim: 6}
				 	);
				} else {
				 	layer.msg("修改失败，连接服务器失败~",
				 		{icon: 5 
				 		,anim: 6}
				 	);
   				}
              },
          });
    	<%--  
    	 obj.update({
        	uUsername: value
        });  --%>
        //layer.close(index);
      	//向服务端发送修改指令
      });

    }

  });
});
</script>
	<script type="text/html" id="roleName">
{{#
 	var fn = function(role){
		return role.rname;
	};
}}
<div>{{ fn(d.role) }}</div>
</script>


</body>
</html>