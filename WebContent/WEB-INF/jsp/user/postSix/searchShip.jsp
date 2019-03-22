<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/post6/searchShip">

		<input type="text" name="shipNo" placeholder="请输入船舷号" />

		<button type="submit">查找</button>
	</form>
	<a href="${pageContext.request.contextPath }/post6/jumpAddShip">
		<button type="submit">新增船只</button>
	</a>

	<script type="text/javascript">
		$(function() {
			$("#myTable").tablesorter();
		});
	</script>


	<table id="myTable" class="tablesorter" border="1">
		<thead>
			<tr>
				<th>船舷号</th>
				<th>船名</th>
				<th>定员</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list" varStatus="loop">
				<tr>
					<td>${list.shipNo }</td>
					<td>${list.shipName}</td>
					<td>${list.seatNum }</td>
					<td>${list.dShipstate}</td>
					<td>
						<form
							action="${pageContext.request.contextPath }/post6/jumpChangeShip">
							<input type="hidden" name="shipNo" value="${list.shipNo}"> <input
								type="submit" value="修改">
						</form>
						<form
							action="${pageContext.request.contextPath }/post6/deleteShip">
							<input type="hidden" name="shipNo" value="${list.shipNo}"> <input
								type="submit" value="删除">
						</form>
						<form
							action="${pageContext.request.contextPath }/post6/showShip">
							<input type="hidden" name="shipNo" value="${list.shipNo}"> <input
								type="submit" value="查询">
						</form>
					</td>


				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>