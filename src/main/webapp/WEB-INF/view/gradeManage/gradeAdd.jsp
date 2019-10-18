<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://www.layuicdn.com/layui/css/layui.css">
<style type="text/css">
.center {
	margin: auto;
}

td {
	width: 150px;
	font-weight: bold;
	height: 50px;
}

.interest {
	height: 30px;
	width: 150px;
}

.input_grade {
	height: 30px;
	width: 150px;
}
</style>
</head>
<body>
	<div class="layui-form">
		<table class="layui-table">
			<thead>
				<tr
					style="color: white; font-weight: bolder; background: rgb(2, 174, 240);">
					<th>成绩录入</th>
				</tr>
			</thead>
		</table>
	</div>
	<form id="formid" action="<%=basePath%>gradeController/addOneGrade"
		method="post">
		<table class="center" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td style="text-align: right;">录入者：</td>
				<td style="color: red">${user_session.uRealname}</td>
			</tr>
			<tr>
				<td style="text-align: right;">学生姓名：</td>
				<td>${userByGrade.uRealname}</td>
			</tr>
			<tr>
				<td style="text-align: right;">学号：</td>
				<td style="font-size: 11px;">${userByGrade.uId}</td>
				<input type="hidden" name="gUid" value="${userByGrade.uId}">
			</tr>
			<tr>
				<td style="text-align: right;">科目：</td>
				<td><select class="interest" name="gCid" value="">
						<c:forEach items="${Course}" var="C">
							<option value="${C.cId}">${C.cName}</option>
						</c:forEach>
				</select></td>
				<td style="color: rgb(102, 102, 102); font-size: 12px;">选择录入的课程科目</td>
			</tr>
			<tr>
				<td style="text-align: right;">成绩：</td>
				<td><input class="input_grade" name="gGrade" value=""
					placeholder="填入成绩0-100之间" onchange="func()" /></td>
				<td style="color: red; font-size: 13px;">*<span class="spanId"></span></td>
			</tr>
			<tr>
				<td></td>
				<td><button class="layui-btn layui-btn-normal btn"
						type="button">确认提交</button></td>
			</tr>
		</table>
	</form>

	<span
		style="color: red; font-size: 12px; font-weight: bold; color: 102, 102, 102;">备注：</span>
	<span>成绩小于60者为成绩不合格</span>
</body>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>
<script type="text/javascript">
	$(".btn").click(function() {
		if (func()) {
			layer.confirm('是否确认提交？', {
				btn : [ '确认', '取消' ]
			//按钮
			}, function() {
				layer.msg('提交成功', {});
				$("#formid").submit();

			}, function() {
				layer.msg('添加信息失败', {});
				layer.closeAll()
			});
		}
	})

	function func() {
		var input = document.querySelector(".input_grade").value
		var spanId = document.querySelector(".spanId");
		if (isNaN(input)) {
			spanId.innerHTML = "你输入的不是数值";
			return false;
		}
		if (input > 100 || input < 0) {
			spanId.innerHTML = "请输入0-100之间的数值";
			return false;
		} else {
			spanId.innerHTML = "";
			return true;

		}
	}
</script>
</html>
