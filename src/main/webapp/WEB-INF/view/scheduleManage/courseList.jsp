<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String erro_mes = request.getParameter("erro_mes");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.table_course {
	width: 100%;
	border: 1px solid rgb(213, 227, 232);
}

td {
	height: 35px;
}
</style>
</head>
<body>
	<form id="formid" action="<%=basePath%>scheduleController/addSCourse?uIds=${user_session.uId}" method="post">
		<div class="main">
			<p style="color: red; font-size: 12px; font-weight: bold;">提示：第一、二节为：早上8.30---中午12.00;第三、四节为：下午13.30---17.00;第五节为:晚自习19.00-20.30</p>
			<table class="table_course" border="1" cellspacing="0"
				cellpadding="0">
				<tr style="background: rgb(228, 240, 252); font-size: 14px;">
					<th width="3%"><button type="button" class="" id="checkall">全选</button></th>
					<th width="10%">课程编号</th>
					<th width="15%">课程名</th>
					<th width="20%">上课时间</th>
					<th width="10%">上课教室</th>
					<th width="10%">任课教师</th>
				</tr>
				<c:forEach items="${Schedule}" var="S">
					<tr style="color: rgb(100, 129, 141); font-size: 14px;">
						<td class="idtd" style="text-align: center;"><input
							class="inp1" type="checkbox" name="id[]" value="${S.scheduleId}"
							id="Job" οnclick="return false;" /></td>
						<td style="text-align: center;">${S.scheduleId}</td>
						<lable for="Job"><td style="text-align: center;">${S.course.cName}</td>	</lable>
						<td style="text-align: center;">星期${S.scheduleDay}---第${S.scheduleTime}节</td>
						<td style="text-align: center;">${S.course.cClassRoom}</td>
						<td style="text-align: center;">${S.user.uRealname}</td>
					</tr>
				</c:forEach>
			</table>
			<button type="button" onclick="submit_btn()">提交</button>
			<button type="reset" class="">重置</button>
			<span style="color: red">${erro_mes}</span>
		</div>
		<script type="text/javascript">
			
		</script>
		<script src="<%=basePath%>js/jquery.js" type="text/javascript"
			charset="utf-8"></script>
		<script type="text/javascript">
			function func() {
				var id = this.value
				alert(id)
			}
			var i = 0;
			$("#checkall").click(function() {
				$("input[name='id[]']").each(function() {
					if (i % 2 == 0) {
						this.checked = true;
					} else {
						this.checked = false;
					}
				});
				i++;
			})
			function submit_btn() {
				var Checkbox = false;
				/* 取当前页面所有name='id[]'的input元素循环遍历，取出每个元素 */
				$("input[name='id[]']").each(function() {
					if (this.checked == true) {
						Checkbox = true;
					}
				});
				if (Checkbox) {
					var t = confirm("您确认要选取这些课程吗?");
					console.log(t)
					if (t == false)
						return false;
					else {
						$("#formid").submit();
					}
				} else {
					alert("请选择至少一门课程！");
					return false;
				}
			}
		</script>
	</form>
</body>
</html>
