<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet"
	href="https://www.layuicdn.com/layui/css/layui.css">
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
<script src="<%=basePath%>js/jquery.table2excel.js"></script>
<script src="<%=basePath%>js/jquery.table2excel.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<fieldset class="layui-elem-field site-demo-button"
		style="margin-top: 30px;">
		<legend>姓名：${userByGrade.uRealname}</legend>
	</fieldset>
	<shiro:hasAnyRoles name="校长,班主任">
		<button type="button" class="layui-btn" id="btn"
			style="background: rgb(2, 174, 240);">
			<i class="layui-icon">&#xe654;</i>添加成绩
		</button>
		<a href="<%=basePath%>gradeController/updateOneGradeByUserId">
			<button type="button" class="layui-btn"
				style="background: rgb(26, 160, 52);">
				<i class="layui-icon"></i>更新
			</button>
		</a>
	</shiro:hasAnyRoles>
	<button type="button" class="layui-btn " onclick="Export();"
			title="导出" style="background: rgb(26, 160, 52);">
			<i class="layui-icon"></i>导出成绩单
	</button>
	<span style="color: red;">操作完成后请手动更新~</span>
	<div class="layui-form">
		<table class="layui-table">
			<colgroup>
				<col width="150">
				<col width="150">
				<col width="200">
				<col>
			</colgroup>
			<thead>
				<tr
					style="color: white; font-weight: bolder; background: rgb(2, 174, 240);">
					<th style="width: 5%">序号</th>
					<th style="width: 25%">科目</th>
					<th style="width: 20%">分数</th>
					<th style="width: 25%">合格与否</th>
					<shiro:hasAnyRoles name="校长,班主任,讲师">
						<th style="width: 25%">操作</th>
					</shiro:hasAnyRoles>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Grade}" var="G">
					<tr>
						<td class="input">${G.gId}</td>
						<td style="text-align: center;">《${G.course.cName}》</td>
						<td>${G.gGrade}.00</td>
						<td><c:if test="${G.gGrade<60}">
								<i class="layui-icon  layui-icon-close-fill"
									style="font-size: 30px; color: red;">
							</c:if> <c:if test="${G.gGrade>=60}">
								</i>
								<i class="layui-icon  layui-icon-ok-circle"
									style="font-size: 30px; color: #1E9FFF;"></i>
							</c:if></td>
						<shiro:hasAnyRoles name="校长,班主任,讲师">
							<td><a class="abtn layui-btn layui-btn-danger" href="javascript:0">修改</a>
							 <a class="layui-btn layui-btn-warm " href="<%=basePath%>gradeController/deleteOneGrade?gId=${G.gId}"
								onClick="return confirm('是否确定删除?');">删除</a></td>
						</shiro:hasAnyRoles>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<table class="layui-table table2excel" style="display: none">
			<colgroup>
				<col width="150">
				<col width="150">
				<col width="200">
				<col>
			</colgroup>
			<thead>
				<tr
					style="color: white; font-weight: bolder; background: rgb(2, 174, 240);">
					<th style="width: 5%">序号</th>
					<th style="width: 25%">科目</th>
					<th style="width: 20%">分数</th>
					<th style="width: 25%">合格与否</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Grade}" var="G">
					<tr>
						<td class="input">${G.gId}</td>
						<td style="text-align: center;">《${G.course.cName}》</td>
						<td>${G.gGrade}.00</td>
						<td><c:if test="${G.gGrade<60}">
							不合格
							</c:if> <c:if test="${G.gGrade>=60}">
								合格
							</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<span
			style="color: red; font-size: 12px; font-weight: bold; color: 102, 102, 102;">备注：</span>
		<span>成绩小于60者为成绩不合格</span>
	</div>
	<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
	<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
	<script src="<%=basePath%>js/jquery.table2excel.js"></script>
	<script type="text/javascript">
		function Export(){
			$(".table2excel").table2excel({
				exclude:".noExl",
				filename: "成绩单", //文件名称  
				exclude_img:false,
				exclude_links:false,
				exclude_inputs:false
			});
		}
	</script>
	<script type="text/javascript">
	var btn=document.querySelector("#btn");
	btn.onclick=function  () {
		layer.open({
			  type: 2,
			  area: ['700px', '500px'],
			  title:'成绩添加',
			  fixed: false, //不固定
			  maxmin: true,
			  anim: 1,
			  skin: 'layui-layer-lan',
			  shade: 0.3,
			  closeBtn: 2,
			  shadeClose: true,
			  content: ['<%=basePath%>courseController/queryCourseAll', 'no' ]
			});
	}
	
	$(function() {
		$(".abtn").click(function() {
			var tr = $(this).parent().parent()
			var id = tr.children("td.input").text();
			layer.open({
				  type: 2,
				  area: ['700px', '500px'],
				  title:'修改成绩',
				  fixed: false, //不固定
				  maxmin: true,
				  anim: 1,
				  skin: 'layui-layer-lan',
				  shade: 0.3,
				  closeBtn: 2,
				  shadeClose: true,
				  content: ['<%=basePath%>gradeController/goUpdateOneGrade?gId='+ id, 'no' ]
						});
					})
		})
	</script>
</body>
</html>