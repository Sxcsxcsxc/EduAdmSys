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
<title></title>
<style type="text/css">
.top {
	width: 1000px;
	height: 68px;
	display: flex;
}

.top_left {
	font-weight: bold;
	font-size: 20px;
	width: 40%;
	line-height: 68px;
	text-align: center;
	border: 1px solid rgb(107, 107, 107);
}

.top_mid {
	font-weight: bold;
	font-size: 20px;
	border: 1px solid rgb(107, 107, 107);
	line-height: 68px;
	text-align: center;
	width: 40%;
}

.top_right {
	font-weight: bold;
	font-size: 20px;
	width: 20%;
	border: 1px solid rgb(107, 107, 107);
	line-height: 68px;
	text-align: center;
}

.left {
	height: 800px;
	width: 100px;
}

._flex {
	width: 1100px;
	display: flex;
	margin: auto;
}

.menu_left {
	height: 133px;
	border: 1px solid rgb(107, 107, 107);
}

.text_a {
	text-align: center;
	line-height: 131px;
}

.top_part {
	text-align: center;
	line-height: 68px;
	width: 20%;
	border: 1px solid rgb(107, 107, 107);
	border-bottom: 0px;
}

.table_show_course {
	width: 1000px;
	font-weight: bold;
}

td {
	width: 20%;
	height: 133px;
	font-size: 13px;
}

body {
	background:
		url("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571204435357&di=c3f3249df9ec8053096d9c02faa5ee0d&imgtype=0&src=http%3A%2F%2Fimg.pptjia.com%2Fimage%2F20190223%2F91ae51b1e2e645ac41078d80ce8a6760.jpg")
		no-repeat;
	background-size: 100% 100%;
}
</style>
</head>
<body>

	<c:if test="${flags!='1'}">
		<div class="main_center">
			<div class="_flex">
				<div class="left red" style="font-family: FZShuTi; font-size: 22px">
					<div class="menu_left red text_a"
						style="font-size: 18px; font-weight: bold; height: 135px;">课程/时间</div>
					<div class="menu_left red text_a">星期一</div>
					<div class="menu_left red text_a">星期二</div>
					<div class="menu_left red text_a">星期三</div>
					<div class="menu_left red text_a">星期四</div>
					<div class="menu_left red text_a">星期五</div>
				</div>
				<div class="top_main">
					<div class="top red">
						<div class="top_left">上午</div>
						<div class="top_mid">下午</div>
						<div class="top_right">晚自习</div>
					</div>

					<div class="top red" style="font-family: FZShuTi; font-size: 22px">
						<div class="top_part">第一节</div>
						<div class="top_part">第二节</div>
						<div class="top_part">第三节</div>
						<div class="top_part">第四节</div>
						<div class="top_part">第五节</div>
					</div>

					<table class="table_show_course" border="1" cellspacing="0"
						cellpadding="0">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

					</table>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${flags=='1'}">
		<div class="main_center">
			<div class="_flex">
				<div class="left red" style="font-family: FZShuTi; font-size: 22px">
					<div class="menu_left red text_a"
						style="font-size: 18px; font-weight: bold; height: 135px;">课程/时间</div>
					<div class="menu_left red text_a">星期一</div>
					<div class="menu_left red text_a">星期二</div>
					<div class="menu_left red text_a">星期三</div>
					<div class="menu_left red text_a">星期四</div>
					<div class="menu_left red text_a">星期五</div>
				</div>
				<div class="top_main">
					<div class="top red">
						<div class="top_left">上午</div>
						<div class="top_mid">下午</div>
						<div class="top_right">晚自习</div>
					</div>

					<div class="top red" style="font-family: FZShuTi; font-size: 22px">
						<div class="top_part">第一节</div>
						<div class="top_part">第二节</div>
						<div class="top_part">第三节</div>
						<div class="top_part">第四节</div>
						<div class="top_part">第五节</div>
					</div>

					<table class="table_show_course" border="1" cellspacing="0"
						cellpadding="0">
						<tr>
							<c:forEach items="${scheduleMon}" var="Mon">
								<c:if test="${Mon.course==null}">
									<td></td>
								</c:if>
								<c:if test="${Mon.course!=null}">
									<td><span> 课程:《${Mon.course.cName}》</span><br>
										授课地点:${Mon.course.cClassRoom} <br> 课程代码:<span
										sytle="font-size:18px">${Mon.scheduleId}</span></td>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${scheduleTues}" var="Tues">
								<c:if test="${Tues.course==null}">
									<td></td>
								</c:if>
								<c:if test="${Tues.course!=null}">
									<td><span>课程:《${Tues.course.cName}》</span><br>
										授课地点:${Tues.course.cClassRoom} <br> 课程代码:<span
										sytle="font-size:18px">${Tues.scheduleId}</span></td>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${scheduleWed}" var="Wed">
								<c:if test="${Wed.course==null}">
									<td></td>
								</c:if>
								<c:if test="${Wed.course!=null}">
									<td><span>课程:《${Wed.course.cName}》</span><br>
										授课地点:${Wed.course.cClassRoom} <br> 课程代码:<span
										sytle="font-size:18px">${Wed.scheduleId}</span></td>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${scheduleThur}" var="Thur">
								<c:if test="${Thur.course==null}">
									<td></td>
								</c:if>
								<c:if test="${Thur.course!=null}">
									<td><span>课程:《${Thur.course.cName}》</span><br>
										授课地点:${Thur.course.cClassRoom} <br> 课程代码:<span
										sytle="font-size:18px">${Thur.scheduleId}</span></td>
								</c:if>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach items="${scheduleFri}" var="Fri">
								<c:if test="${Fri.course==null}">
									<td></td>
								</c:if>
								<c:if test="${Fri.course!=null}">
									<td><span>课程:《${Fri.course.cName}》</span><br>
										授课地点：${Fri.course.cClassRoom} <br> 课程代码:<span
										sytle="font-size:18px">${Fri.scheduleId}</span></td>
								</c:if>
							</c:forEach>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</c:if>
</body>
</html>
