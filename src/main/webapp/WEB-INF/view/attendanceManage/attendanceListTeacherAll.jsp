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
<meta charset="utf-8">
<title>layui</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="https://www.layuicdn.com/layui/css/layui.css">
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

	<table class="layui-hide" id="test" lay-filter="test"></table>

	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
  </div>
</script>
	<script src="https://www.layuicdn.com/layui/layui.js"></script>
<script>
layui.use('form', function(){
  var form = layui.form;
  
  //监听提交
  form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  });
});
</script>
<!--
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>  -->
	<script type="text/html" id="barDemo">
	
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="update0">缺席</a>
 <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="update1">打卡</a>
<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>



<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
   //,url:'table/demo1.json'
    	
  ,url:"<%=basePath%>attendanceController/query/TeacherAllPage"
    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
      title: '提示'
      ,layEvent: 'LAYTABLE_TIPS'
      ,icon: 'layui-icon-tips'
    }]
  ,page: true //true表示分页
  ,limit: 2 //显示的几条数据
    ,title: '用户数据表'
    ,cols: [[
             {type: 'checkbox', fixed: 'left'}
             ,{field:'attenId', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
             ,{field:'u_realname', title:'姓名', width:150, sort: true,templet: function(res){
               return '<em>'+ res.user.uRealname +'</em>'
             }}
             ,{field:'cName', title:'课程名', width:150, sort: true,templet: function(res){
               return '<em>'+ res.course.cName +'</em>'
             }}
             ,{field:'cClassRoom', title:'教室', width:150, sort: true, templet: function(res){
                 return '<em>'+ res.course.cClassRoom +'</em>'
             }}
             ,{field:'attenState', title:'打卡状态', width:120,  templet: function(res){
            	 var staus;
            	 if(res.attenState==1){
            		 staus="<i class='layui-icon layui-icon-ok' style='font-size: 30px; color: #2ec770;'></i> ";
            	 }else{
            		 staus="<i class='layui-icon layui-icon-close' style='font-size: 30px; color: #ff4100;'></i>  ";
            	 }
                 return '<em>'+  
                 staus
                 +'</em>'
             }}
             
             ,{field:'attendCreateTime', title:'时间', width:120 ,templet: '<div>{{ layui.laytpl.toDateString(d.attendCreateTime) }}</div>'}          
             ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
           ]]
    
  });
//时间戳的处理				
layui.laytpl.toDateString = function(d, format){				  
	var date = new Date(d)				  
	,ymd = [					
	        this.digit(date.getFullYear(), 4)					
	        ,this.digit(date.getMonth() + 1)					
	        ,this.digit(date.getDate())				  
	        ]				  
	,hms = [					
	        this.digit(date.getHours())					
	        ,this.digit(date.getMinutes())					
	        ,this.digit(date.getSeconds())				  
	        ];		 				  
	format = format || 'yyyy-MM-dd HH:mm:ss';		 				  
	return format.replace(/yyyy/g, ymd[0])				  
	.replace(/MM/g, ymd[1])				  
	.replace(/dd/g, ymd[2])				  
	.replace(/HH/g, hms[0])				  
	.replace(/mm/g, hms[1])				  
	.replace(/ss/g, hms[2]);				
	};
	//数字前置补零				
	layui.laytpl.digit = function(num, length, end)
	{				  
		var str = '';				  
		num = String(num);				  
		length = length || 2;				  
		for(var i = num.length; i < length; i++){					
			str += '0';				  
			}				  
		return num < Math.pow(10, length) ? str + (num|0) : num;				
		};  


  
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
    var data = obj.data;
    console.log(data) 
    var attenId = data.attenId;   
    var cName = data.course.cName;
    var cClassRoom = data.course.cClassRoom;
    var attenState = data.attenState;
    var attendCreateTime=data.attendCreateTime;
    if(obj.event === 'del'){
      layer.confirm('确认删除？', function(index){
    	  $.ajax({
              url:"<%=basePath%>attendanceController/_delete_/deleteAttendance" , 			// 请求路径
              type:"POST" , 						//请求方式
              data:{"attenId":attenId},
				dataType:"text"	,					//设置接受到的响应数据的格式	
              success:function (data) {
            	  if(data==1){
            		  obj.del();
            		  layer.msg('删除成功！',{anim: 6});
            		 // alert("删除成功！");
            	  }else{
            		  alert("删除失败！");
            	  }
              },									//响应成功后的回调函数
              error:function () {
                  alert("出错啦...")
              },									//表示如果请求响应出现错误，会执行的回调函数
          });
        layer.close(index);
      });
    }
    else if(obj.event ==='update0'){
      	  $.ajax({
                url:"<%=basePath%>attendanceController/_update_0/updateAttendance" , 			// 请求路径
                type:"POST" , 						//请求方式
                data:{"attenId":attenId},
  				dataType:"text"	,					//设置接受到的响应数据的格式	
                success:function (data) {
              	  if(data==1){
              	      obj.update({
              	    	attenState: "0"
              	      });
              		  layer.msg('缺勤登记成功！',{anim: 1});
              		 // alert("删除成功！");
              	  }else{
              		  alert("缺勤登记失败！");
              	  }
                },									//响应成功后的回调函数
                error:function () {
                    alert("出错啦...")
                },									//表示如果请求响应出现错误，会执行的回调函数
            });
          layer.close(index);
      }
    else if(obj.event ==='update1'){
      	  $.ajax({
                url:"<%=basePath%>attendanceController/_update_1/updateAttendance" , 			// 请求路径
                type:"POST" , 						//请求方式
                data:{"attenId":attenId},
  				dataType:"text"	,					//设置接受到的响应数据的格式	
                success:function (data) {
              	  if(data==1){
             	      obj.update({
                	    	attenState: "1"
                	        });
              		  layer.msg('打卡登记成功！',{anim: 1});
              		 // alert("删除成功！");
              	  }else{
              		  alert("打卡登记失败！");
              	  }
                },									//响应成功后的回调函数
                error:function () {
                    alert("出错啦...")
                },									//表示如果请求响应出现错误，会执行的回调函数
            });
          layer.close(index);
      }
    else if(obj.event === 'edit'){
    	$.ajax({
            url:"<%=basePath%>attendanceController/update/updateAttendance", // 请求路径
																type : "POST", //请求方式
																data : {
																	"attenId" : attenId,

																	"attenState" : attenState

																},
																dataType : "text", //设置接受到的响应数据的格式	
																success : function(
																		data) {
																	if (data == 1) {
																		alert("修改成功！");
																	} else {
																		alert("修改失败！");
																	}

																}, //响应成功后的回调函数
																error : function() {
																	alert("出错啦...")
																}, //表示如果请求响应出现错误，会执行的回调函数
															});

												}
											});
						});
	</script>

</body>
</html>