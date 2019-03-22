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
<form action="${pageContext.request.contextPath }/post5/checkTicket">
		
		<input type="text" name="tickNo" placeholder="请输入票号" /> 
			
		<button type="submit">检票</button>
	</form>
	<h1 style="color: red">无效的票号</h1>
<script type="text/javascript">
$(function() {
	  $("#myTable").tablesorter();
	});
</script>


	<table id="myTable" class="tablesorter">
		<thead>
			<tr>
				<th>票号</th>
				<th>订票日期</th>
				<th>船次</th>
				<th>船票状态</th>
				
				<th>检票时间</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list" varStatus="loop">
				<tr>
					<td>${list.tickNo }</td>
					<td>${tickList[loop.count-1] }</td>
					<td>${list.tickTime }</td>
					<td>${list.state }</td>
					<td>${checkList[loop.count-1] }</td>
					
					
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>