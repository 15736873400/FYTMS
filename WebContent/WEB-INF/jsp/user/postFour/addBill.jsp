<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	addBill ${list}
<form action="${pageContext.request.contextPath }/post4/addTicket/${passportNo}/${shiptimeNo}">
		<!-- 用户护照号 <input type="text" name="passportNo" /><br /> 
		用户姓名<input type="text" name="trName" /><br />  -->
		确认订单
		<!-- 请选择乘客身份:<select name="isGuide">
			
				<option value="0">旅客</option>
			<option value="1">导游</option>
			
			
		</select><br />  -->
		<%-- 年龄<input type="text" name="trAge" /><br /> 旅行社 <select name="trTravel">
			<c:forEach items="${travelList}" var="tl">
				<option value="${tl.legalNo }">${tl.travelName }(${tl.legalNo })</option>
			</c:forEach>
		</select><br /> --%>
		<!-- 港口旅行社<input type="text" name="trPort" /><br /> -->
		<input type="submit" value="下订单">
	</form>
		
</body>
</html>