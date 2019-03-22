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
	<form action="${pageContext.request.contextPath }/post6/changeShip">

		船舷号<input type="text" readonly="readonly" name="shipNo" value=${list.shipNo } /><br/>
		请输入船名<input type="text" name="shipName" value=${list.shipName }  /><br/>
		请输入定员<input type="text" name="seatNum" value=${list.seatNum }  /><br/>
		请选择船只状态<select name="shipState">
			<c:forEach items="${st}" var="st">
				<option value="${st.idt_dic_shipstate }">${st.dShipstate }</option>
			</c:forEach>
		</select><br/>
		<button type="submit">修改</button>
	</form>
	
</body>
</html>