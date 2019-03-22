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
	<form action="${pageContext.request.contextPath }/post6/searchTravel">

		<input type="text" name="legalNo" placeholder="请输入工商号" />

		<button type="submit">查找</button>
	</form>
	<a href="${pageContext.request.contextPath }/post6/jumpAddTravel">
		<button type="submit">新增旅行社</button>
	</a>

	<script type="text/javascript">
		$(function() {
			$("#myTable").tablesorter();
		});
	</script>


	<table id="myTable" class="tablesorter" border="1">
		<thead>
			<tr>
				<th>工商号</th>
				<th>旅行社名</th>
				<th>法人姓名</th>
				<th>法人手机号</th>
				<th>余额</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list" varStatus="loop">
				<tr>
					<td>${list.legalNo }</td>
					<td>${list.travelName}</td>
					<td>${list.legalName }</td>
					<td>${list.legalPhone}</td>
					<td>${list.money }</td>
					<td>
						<form
							action="${pageContext.request.contextPath }/post6/jumpChangeTravel">
							<input type="hidden" name="legalNo" value="${list.legalNo}"> <input
								type="submit" value="修改">
						</form>
						<form
							action="${pageContext.request.contextPath }/post6/deleteTravel">
							<input type="hidden" name="legalNo" value="${list.legalNo}"> <input
								type="submit" value="删除">
						</form>
						<form
							action="${pageContext.request.contextPath }/post6/showTravel">
							<input type="hidden" name="legalNo" value="${list.legalNo}"> <input
								type="submit" value="查询">
						</form>
					</td>


				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form action="${pageContext.request.contextPath }/post6/searchTravel">
	<c:forEach items="${page}" var="page" varStatus="loop">
		<input type="submit" value="${page }" name="page">
   </c:forEach>
   </form>


</body>




</html>