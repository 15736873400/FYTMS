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
	<form action="${pageContext.request.contextPath }/post6/addShip">

		<input type="text" name="shipNo" placeholder="请输入船号" /><br/>
		<input type="text" name="shipName" placeholder="请输入船名" /><br/>
		<input type="text" name="seatNum" placeholder="请输入定员" /><br/>
		请选择船只状态:<select name="shipState">
			<c:forEach items="${st}" var="st">
				<option value="${st.idt_dic_shipstate }">${st.dShipstate }</option>
			</c:forEach>
		</select><br/>

		<button type="submit">添加</button>
	</form>
	
</body>
</html>