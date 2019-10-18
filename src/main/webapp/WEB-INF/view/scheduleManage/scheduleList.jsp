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
<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<table class="layui-hide" id="test" lay-filter="test"></table>

	<script type="text/html" id="toolbarDemo">
  <div class="layui-form-item">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>

	<button class="layui-btn layui-btn-sm abc" onclick="ins()">添加</button>
    <label >ID:</label>
      <input type="text" name="cId" id="cId_id" >
    <label >教室:</label>
      <input type="text" name="cClassRoom" id="cClassRoom_id" >
    <label >课程名:</label>
      <input type="text" name="cName" id="cName_id">
  </div>

</script>
<script type="text/javascript">
function ins(){
var cId = 		$("#cId_id").val();
var cName = 	$("#cName_id").val();
var cClassRoom = 	$("#cClassRoom_id").val();
	$.ajax({
        url:"<%=basePath%>courseController/insert/insertClassroom", // 请求路径
					type : "POST", //请求方式
					data : {
						"cId" : cId,
						"cName" : cName,
						"cClassRoom" : cClassRoom
					},
					dataType : "text", //设置接受到的响应数据的格式	
					success : function(data) {
						if (data == 1) {
							alert("插入成功！");
						} else {
							alert("插入失败！");
						}

					}, //响应成功后的回调函数
					error : function() {
						alert("出错啦...")
					}, //表示如果请求响应出现错误，会执行的回调函数
				});

}
</script>
<script>
//Demo
layui.use('form', function(){
  var form = layui.form;
  
  //监听提交
  form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  });
});
</script>
	<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">更新</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>


	<script src="https://www.layuicdn.com/layui/layui.js"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

	<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
   //,url:'table/demo1.json'
    	
  ,url:"<%=basePath%>scheduleController/query/querySchedule"
    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
      title: '提示'
      ,layEvent: 'LAYTABLE_TIPS'
      ,icon: 'layui-icon-tips'
    }]
    ,title: '用户数据表'
    ,cols: [[
             {type: 'checkbox', fixed: 'left'}
             
             ,{field:'ID', title:'ID', width:150, sort: true, templet: function(res){
               return '<em>'+ res.scheduleId +'</em>'
             }}
             ,{field:'cName', title:'课程名', edit:'text',width:150, sort: true, templet: function(res){
               return '<em>'+ res.course.cName +'</em>'
             }}
             ,{field:'cClassRoom', title:'教室', edit:'text',width:150, sort: true, templet: function(res){
               return '<em>'+ res.course.cClassRoom +'</em>'
             }}
             ,{field:'uRealname', title:'教师',edit:'text', width:150,sort: true, templet: function(res){
               return '<em>'+ res.teaUser.uRealname +'</em>'
             }}
             ,{field:'uRealname', title:'学生',edit:'text', width:150,sort: true, templet: function(res){
               return '<em>'+ res.stuUser.uRealname +'</em>'
             }}
             ,{field:'scheduleTime', title:'上课时间',edit:'text', width:150,sort: true, templet: function(res){
               return '<em>'+ res.scheduleTime +'</em>'
             }}
             
             ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
           ]]
    ,page: true
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
      case 'ins':
    	  layer.alert('插入');
      break;
    };
  });
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
	  
    var cId = data.cId;
    var cName = data.cName;
    var cClassRoom = data.cClassRoom;
    if(obj.event === 'del'){
      layer.confirm('确认删除？', function(index){
    	  $.ajax({
              url:"<%=basePath%>courseController/_delete_/deleteClassroom" , 			// 请求路径
              type:"POST" , 						//请求方式
              data:{"cId":cId},
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
    } else if(obj.event === 'edit'){
    	$.ajax({
            url:"<%=basePath%>courseController/update/updateClassroom" , 			// 请求路径
            type:"POST" , 						//请求方式
            data:{
            	"cId":cId,
            	"cName":cName,
            	"cClassRoom":cClassRoom
            	},
				dataType:"text"	,					//设置接受到的响应数据的格式	
            success:function (data) {
          	  if(data==1){
          		  alert("修改成功！");
          	  }else{
          		  alert("修改失败！");
          	  }
                
            },									//响应成功后的回调函数
            error:function () {
                alert("出错啦...")
            },									//表示如果请求响应出现错误，会执行的回调函数
        });

    }
			});
		});
	</script>

</body>
</html>