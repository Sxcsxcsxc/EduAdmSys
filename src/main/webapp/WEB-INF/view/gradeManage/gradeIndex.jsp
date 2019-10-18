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
<body>
	<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="queryGrade">
	<i class="layui-icon layui-icon-list"></i>成绩
	</a>
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
    	
  ,url:"<%=basePath%>user/query/queryAllUserListByPage?roleId=4"
    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
      title: '提示'
      ,layEvent: 'LAYTABLE_TIPS'
      ,icon: 'layui-icon-tips'
    }]
    ,title: '用户数据表'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'uId', title:'ID', width:280, fixed: 'left', sort: true}
      ,{field:'uUsername', title:'用户名', width:165}
      ,{field:'uRealname', title:'真实姓名', width:170}
      ,{field:'roleId', title:'角色', width:80, templet:'#roleIdTemplet'}
      ,{field:'uState', title:'状态', width:80, templet:'#uStateTemplet', unresize: true, sort: true}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo',width:200}
    ]]
    ,page: true
    ,limit:15
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
    console.log(user.uId)
    console.log(JSON.stringify(user));
    
    if(obj.event === 'queryGrade'){
    	var uId=user.uId;
    	 location.href = "<%=basePath%>gradeController/queryOneGradeByUserId?uId=" + uId;
        } 
  });
});
</script>
	<script type="text/html" id="roleIdTemplet">
	{{#
 		var fn = function(roleId){
			if(roleId == '2'){
				return '班主任';
			}else if(roleId == '3'){
				return '讲师';
			}else if(roleId == '4'){
				return '学生';
			}
		};
	}}
	<div>{{ fn(d.roleId) }}</div>
	</script>

	<script type="text/html" id="uStateTemplet">
	{{#
 		var fn = function(uState){
			if(uState == '1'){
				return '<i class="layui-icon layui-icon-ok-circle" style="font-size: 30px; color: #5FB878;"></i>';
			}else{
				return '<i class="layui-icon layui-icon-close-fill" style="font-size: 30px; color: #FF5722;"></i>';
			}
		};
	}}
	<div>{{ fn(d.uState) }}</div>
	</script>
</body>
</html>