<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>

<head>
	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>旅客信息维护</title>
</head>

<body>
	<form action="${pageContext.request.contextPath }/travel/jump" method="post">
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<input type="submit" value="返回">
	</form>
	欢迎${travel.travelName }<br />
	工商登记号:${travel.legalNo }<br />
	账户余额:${travel.money }元<br />
	退款金额:${travel.refund }元<br />
	<form action="${pageContext.request.contextPath }/travel/searchPassportNo" method="post">
		<input type="text" name="passportNo" placeholder="请输入游客护照号" />
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<button type="submit">模糊自身查找</button>
	</form>
	<form action="${pageContext.request.contextPath }/travel/searchAllPassportNo" method="post">
		<input type="text" name="passportNo" placeholder="请输入游客护照号" />
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<button type="submit">全局精确查找</button>
	</form>
	<%-- <form action="${pageContext.request.contextPath }/travel/weihuTraveller" method="post">
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<input type="submit" value="显示未购票乘客信息">
	</form> --%>
	<form action="${pageContext.request.contextPath }/travel/addTraveller" method="post">
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<input type="hidden" value=${travel.travelName } readonly="readonly" name="travelName">
		<input type="submit" value="添加旅客">
	</form>

	<form action="${pageContext.request.contextPath }/travel/searchTicket">
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
	</form>
	<script type="text/javascript">
		$(function () {
			$("#myTable").tablesorter();
		});
	</script>
	<table id="myTable" class="tablesorter" border="1">
		<thead>
			<tr>
				<th>护照号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>出生日期</th>
				<th>出生地</th>
				<th>国籍</th>
				<th>旅行社</th>
				<th colspan="3">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list" varStatus="loop">
				<tr>
					<td>${list.passportNo }</td>
					<td>${list.trName}</td>
					<td>${list.dSex }</td>
					<td>${list.trBirthday }</td>
					<td>${list.trBorAdd}</td>
					<td>${list.trNation}</td>
					<td>${list.travelName }</td>
					<td>
						<form action="${pageContext.request.contextPath }/travel/jumpChangeT" method="post">
							<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
							<input type="hidden" value=${list.passportNo } readonly="readonly" name="passportNo">
							<input type="submit" value="修改">
						</form>
					</td>
					<td>
						<form action="${pageContext.request.contextPath }/travel/deleteT" method="post">
							<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
							<input type="hidden" value=${list.passportNo } readonly="readonly" name="passportNo">
							<input type="submit" value="删除">
						</form>
					</td>
					<td>
						<form action="${pageContext.request.contextPath }/travel/jSearchTeam" method="post">
							<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
							<input type="hidden" value=${list.passportNo } readonly="readonly" name="passportNo">
							<input type="submit" value="添加到团">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>

</html>