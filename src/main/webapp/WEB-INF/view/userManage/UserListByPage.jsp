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
<body style=" background-color: rgb(242,242,242);">
<div>
	<div class="layadmin-tabsbody-item layui-show">
		<div class="layui-fluid" style="margin-top: 17px;">
			<div class="layui-card">
				<!-- 模糊查询&条件查询 -->
				<div id="UserSearchTable" style="height: 150px;" class="layui-form layui-form-pane layui-card-header layuiadmin-card-header-auto" lay-filter="app-content-list">
				<div class="layui-form-item" style="padding-top: 15px; padding-bottom: 15px;">
					<div>
						<div class="layui-inline">
							<label class="layui-form-label">用户id：</label>
							<div class="layui-input-block">
								<input id="uId" type="text" name="uId" placeholder="请输入用户id" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-inline">
							<button id="tableReloadForAccurate " class="layui-btn layui-btn-radius layui-btn-warm layuiadmin-btn-list" data-type="reload">
								<i class="layui-icon layui-icon-search layuiadmin-button-btn">精准查询</i>
							</button>
						</div>
						
					</div>
					
					<div class="layui-inline">
						<label class="layui-form-label">用户名：</label>
						<div class="layui-input-inline">
							<input id="uUsername" type="text" name="uUsername" placeholder="请输入用户名" autocomplete="off" class="layui-input">
						</div>
					</div>
					
					<div class="layui-inline">
						<label class="layui-form-label">真实姓名</label>
						<div class="layui-input-inline">
							<input id="uRealname" type="text" name="uRealname" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
						</div>
					</div>
					
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
					</div>
					<div class="layui-inline">
						<label class="layui-form-label">激活状态</label>
						<div class="layui-input-inline">
							<select id="uState" name="uState">
								<option value="">请选择激活状态</option>
								<option value="1">激活</option>
								<option value="0">锁定</option>
							</select>
						</div>
					</div>
					<div class="layui-inline">
						<button id="tableReload" class="layui-btn layui-btn-radius layuiadmin-btn-list" data-type="reload">
							<i class="layui-icon layui-icon-search layuiadmin-button-btn">模糊查询</i>
						</button>
						<!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
					</div>
				</div>
			</div>
			
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
<!-- 
	<button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
 -->
	<button class="layui-btn layui-btn-danger" lay-event="deleteSelectAll">批量禁用</button>
    <button class="layui-btn layui-btn-warm" lay-event="getCheckLength">批量修改角色</button>
	<button class="layui-btn layui-btn layui-btn-normal" lay-event="addUser">
		<i class="layui-icon layui-icon-add-circle-fine">
			添加一个用户
		</i>
	</button>
<!--  
	<c:if test="${roleId != 4}"> </c:if> <c:if test="${roleId == 4}"> <button class="layui-btn layui-btn layui-btn-normal" lay-event="addUser"> <i class="layui-icon layui-icon-add-circle-fine"> 添加一个学生 </i> </button> </c:if>
-->
  </div>
</script>
	<script type="text/html" id="barDemo">
  	<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"> <i class="layui-icon layui-icon-edit">编辑</i></a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="freeze">
		<i class="layui-icon layui-icon-close">禁用</i>
	</a>
	<a class="layui-btn layui-btn-xs" lay-event="enabled">
		<i class="layui-icon layui-icon-face-smile-fine">启用</i>
	</a>

  	<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="editRole">修改用户角色</a>
	</script>
	
	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://www.layuicdn.com/layui/layui.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>
layui.use('table', function(){
  var table = layui.table;
  var layer = layui.layer;
  var form = layui.form;
  
  table.render({
    elem: '#test'
   //,url:'table/demo1.json'
    //?roleId=${roleId}
  ,url:"<%=basePath%>user/query/queryAllUserListByPage"
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
      ,{field:'uId', title:'ID', width:280, fixed: 'left', sort: true}
      ,{field:'uUsername', title:'用户名(可修改)', width:165, edit: 'text', sort: true}
      ,{field:'uRealPW', title:'密码(可修改)', width:160, edit: 'text'}
      ,{field:'uRealname', title:'真实姓名(可修改)', width:170, edit: 'text', sort: true}
      ,{field:'roleId', title:'角色', width:80, templet:'#roleIdTemplet'}
      ,{field:'uState', title:'状态', width:80, templet:'#uStateTemplet', unresize: true, sort: true}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo',width:340}
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
      case 'deleteSelectAll':
          var userArr = checkStatus.data;
        	//layer.alert(JSON.stringify(userArr));
        	console.log(userArr)
        	//console.log(userArr[i].uId)
        	//console.log(userArr[i])
        	var userForCUListId = [];
          for ( var i in userArr) {
        	  userForCUListId.push(userArr[i].uId)
			}
          console.log("提取选中的用户ID:"+userForCUListId)
          if(userArr == ''){
        	  layer.msg('没有选中任何',{anim:6})
          }else{
          layer.confirm('真的禁用所选的么？', function(index){
        	  $.ajax({
                  url: "<%=basePath%>user/delete/deletUserByUserForCUId",
                  type: "POST",
                  data: {"userForCUListId":userForCUListId},
                  //data: userForCUListId,
                  dataType: "json",
                  traditional:true,//防止深度序列化
                  success: function(data){
       	           console.log(data);	
               	   if (data > 0) {
       	            	//前端修改这行数据
       	            	//封装一个重载账号状态的js函数直接调用
       	            	
       	           		//obj.del();
       	                //关闭删除框
       	                layer.close(index);
       	                layer.msg("禁用成功", {icon: 6});
       				} else {
       				 	layer.msg("禁用失败",{icon: 5 ,anim: 6});
       				}
                  },
                  error : function(data){
                	  layer.msg("连接服务器失败，请联系管理员",{icon:5 ,anim:6 ,time:5000});
                  }
              });
          });
        }
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
       	
    if(obj.event === 'freeze'){
      layer.confirm('真的要禁用吗？', function(index){
      	//向服务端发送删除指令
      	$.ajax({
           url: "<%=basePath%>user/delete/deletUserByUserForCUId",
           type: "POST",
           data:{"uId":user.uId},
           dataType: "json",
           success: function(data){
	           console.log(data);	
        	   if (data > 0) {
	            	//前端修改这行数据
	            	obj.update({
   	            		uState: 0
				    });
	                //关闭删除框
	                layer.close(index);
	                layer.msg("禁用成功", {icon: 6});
				} else {
				 	layer.msg("禁用失败",
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
    }else if(obj.event === 'enabled'){
        layer.confirm('确定启用吗？', function(index){
        	var userForCU_ui = {
       			uId : user.uId,
       			uState : 1
       			/* uUsername : null,
        		uPassword : null,
        		uRealname : null */
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
  	            	//前端修改这行数据
  	            	obj.update({
 	            		uState: 1
  				    });
  	                //关闭删除框
  	                layer.close(index);
  	                layer.msg("启用成功", {icon: 6});
  				} else {
  				 	layer.msg("启用失败",
  				 		{icon: 5 
  				 		,anim: 6}
  				 	);
  				}
             },
         });
       }); 
    } else if(obj.event === 'edit'){
    	/* 修改用户信息功能 */
        //var userForCU_ui= user;
    	layer.prompt({
        formType: 2
        ,value: '用户id：'+user.uId+'\n用户名:'+user.uUsername+'\n密码：'+user.uRealPW + '\n真实姓名：'+ user.uRealname
      }, function(value, index){
    	  var userForCU_ui={
    		uId : user.uId,
    		uUsername : user.uUsername,
    		uPassword : user.uPassword,
    		uRealname : user.uRealname,
    		uRealPW : user.uRealPW
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
   	                //关闭删除框
   	                layer.close(index);
   	                layer.msg("修改成功", {icon: 6});
   				} else if(data == -99){
					layer.msg("修改失败，已存在该用户民请换一个哟~",
				 		{icon: 5 
				 		,anim: 6}
				 	);
				} else {
  				 	layer.msg("修改失败",
  				 		{icon: 5 
  				 		,anim: 6}
  				 	);
   				}
              },
          });
      });
    }else if(obj.event === 'editRole'){
    	/* layer.prompt({
            formType: 2
            ,value: '<div class="layadmin-tabsbody-item layui-show"> <form class="layui-form layui-form-pane "> <div class="layui-form-item"> <div class="layui-inline"> <label class="layui-form-label">角色</label> <div class="layui-input-inline"> <select id="roleId" name="roleId"> <option value="">请选择角色</option> <option value="2">班主任</option> <option value="3">讲师</option> <option value="4">学生</option> </select> </div>  <div class="layui-input-inline"> <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">立即修改</button> <button type="reset" class="layui-btn layui-btn-primary">重置</button> </div> </div> </div> </form> </div>'
          });  */
    	

    	layer.open({
   		  type: 1, 
   		 skin: 'layui-layer-molv',
   		area: ['520px', '260px'],
   		//这里content是一个普通的String
   		  content: '<div class="layadmin-tabsbody-item layui-show"> <form class="layui-form layui-form-pane "> <div class="layui-form-item"> <div class="layui-inline"> <label class="layui-form-label">角色</label> <div class="layui-input-inline"> <select id="roleId" name="roleId"> <option value="">请选择角色</option> <option value="2">班主任</option> <option value="3">讲师</option> <option value="4">学生</option> </select> </div>  <div class="layui-input-inline"> <button class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">立即修改</button> <button type="reset" class="layui-btn layui-btn-primary">重置</button> </div> </div> </div> </form> </div>' 
   		});
    	<%--  
   	 	obj.update({
       	uUsername: value
       });  --%>
    }

  });
  
  /* 表格数据重载
 	 用于条件查询
 	 模糊查询等~
  */
  var $ = layui.$, active = {
    reload: function(){
    //获取输入框的值
      var uId = $('#uId').val();
      var uUsername = $('#uUsername').val();
      var uRealname = $('#uRealname').val();
      var roleId = $('#roleId').val();
      var uState = $('#uState').val();
      //防止传入后端为''的数据
      //if(uUsername == ''){ uUsername = -1}
      //if(uRealname == ''){ uRealname = -1}
      
      console.log('uUsername：    '+uUsername + '  uRealname：  '+ uRealname+ '   roleId：   '+roleId+ '   uState：  '+uState)
      //执行重载
      table.reload('test', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
	        uId : uId,
	        uUsername : uUsername,
	      	uRealname : uRealname,
	      	roleId : roleId,
	      	uState : uState
        }
      }, 'data');
    }
  };
  //找到搜索按钮并执行点击事件
  $('#tableReload').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
  <%-- var uUsername = $('#').val();
  	table.reload('test', {
  		
  		url: '<%=basePath%>user/query/queryAllUserListByPage'
		,method:'post'
	  	,where: {} //设定异步数据接口的额外参数
	}); --%>
  
});
</script>
	<script type="text/html" id="roleIdTemplet">
	{{#
 		var fn = function(roleId){
			if(roleId == '1'){
				return '超级管理员';
			}else if(roleId == '2'){
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