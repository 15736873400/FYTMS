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
	<form action="${pageContext.request.contextPath }/post6/searchShiptime">
        <select name="shipState">
				<option value="0">船次</option>
				<option value="1">船舷</option>
		</select>
		<input type="text" name="shipNo" placeholder="请输入船次号／船舷号" />

		<button type="submit">查找</button>
	</form>
	<a href="${pageContext.request.contextPath }/post6/jumpAddShiptime">
		<button type="submit">新增船次</button>
	</a>

	<script type="text/javascript">
		$(function() {
			$("#myTable").tablesorter();
		});
	</script>


	<table id="myTable" class="tablesorter" border="1">
		<thead>
			<tr>
				<th>船次</th>
				<th>票价</th>
				<th>船舷号</th>
				<th>出发时间</th>
				<th>出发港口</th>
				<th>到达时间</th>
				<th>到达港口</th>
				<th>售票时间</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list" varStatus="loop">
				<tr>
				    <td>${list.shiptimeNo }</td>
					<td>${list.price}</td>
					<td>${list.shipNo }</td>
					<td>${startList[loop.count-1] }</td>
					<td>${list.startPort}</td>
					<td>${arrList[loop.count-1] }</td>
					<td>${list.arrPort}</td>
					<td>${sellList[loop.count-1] }</td>
					<td>${list.dShiptimestate}</td>
					<td>
						<form
							action="${pageContext.request.contextPath }/post6/jumpChangeShiptime">
							<input type="hidden" name="shiptimeNo" value="${list.shiptimeNo}"> <input
								type="submit" value="修改">
						</form>
						<form
							action="${pageContext.request.contextPath }/post6/deleteShiptime">
							<input type="hidden" name="shiptimeNo" value="${list.shiptimeNo}"> <input
								type="submit" value="删除">
						</form>
						<form
							action="${pageContext.request.contextPath }/post6/showShiptime">
							<input type="hidden" name="shiptimeNo" value="${list.shiptimeNo}"> <input
								type="submit" value="查询">
						</form>
					</td>


				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>