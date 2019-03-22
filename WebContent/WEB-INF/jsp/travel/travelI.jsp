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
	<title>选择旅客</title>
</head>

<body>
	欢迎${travel.travelName }<br />
	工商登记号:${travel.legalNo }<br />
	账户余额:${travel.money }元<br />
	<form action="${pageContext.request.contextPath }/travel/teamNo" method="post">
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
					<th>出生地</th>
					<th>国籍</th>
					<th>旅行社</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list" varStatus="loop">
					<tr>
						<td><input type="checkbox" name="passportNo" value="${list.passportNo }+${list.trName }"
								class="checkbox">${list.passportNo }</td>
						<td>${list.trName}</td>
						<td>${list.dSex }</td>
						<td>${list.trBorAdd}</td>
						<td>${list.trNation}</td>
						<td>${list.travelName }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		${returnDate }
		${startDate }
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<input type="hidden" value=${shiptimeNo } readonly="readonly" name="shiptimeNo">
		<input type="hidden" value="${startDate }" readonly="readonly" name="st">
		<input type="hidden" value="${returnDate }" readonly="readonly" name="re">
		<input type="submit" value="提交" />
	</form>
	剩余座位:${seat }个
</body>

</html>