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
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="https://www.layuicdn.com/layui/css/layui.css">
  <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
 
<table class="layui-hide" id="test" lay-filter="test"></table>
<script src="https://www.layuicdn.com/layui/layui.js"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 --> 
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
<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
   //,url:'table/demo1.json'
    	
  ,url:"<%=basePath%>attendanceController/query/StudentAllPage"
   /*  ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板 
    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
      title: '提示'
      ,layEvent: 'LAYTABLE_TIPS'
      ,icon: 'layui-icon-tips'
    }] */
    ,page: true //true表示分页
    ,limit: 2 //显示的几条数据
    ,title: '用户数据表'
    ,cols: [[
             
			/* {type: 'checkbox', fixed: 'left'} */
             ,{field:'u_realname', title:'姓名', width:150, templet: function(res){
               return '<em>'+ res.user.uRealname +'</em>'
             }}
             ,{field:'cName', title:'课程名', width:150, templet: function(res){
               return '<em>'+ res.course.cName +'</em>'
             }}
             ,{field:'cClassRoom', title:'教室', width:150,  templet: function(res){
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
});
</script>

</body>
</html>