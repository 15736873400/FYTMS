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
	<form action="${pageContext.request.contextPath }/post4/addTraveller">
		用户护照号 <input type="text" name="passportNo" /><br /> 
		用户姓名<input type="text" name="trName" /><br /> 
		性别<select name="trSex">
			<c:forEach items="${sexList}" var="sl">
				<option value="${sl.idt_dic_sex }">${sl.dSex }</option>
			</c:forEach>
		</select><br /> 
		联系方式<input type="text" name="trPhone" /><br /> 旅行社 <select name="trTravel">
			<c:forEach items="${travelList}" var="tl">
				<option value="${tl.legalNo }">${tl.travelName }(${tl.legalNo })</option>
			</c:forEach>
		</select><br />
		<!-- 港口旅行社<input type="text" name="trPort" /><br /> -->
		<input type="submit" value="添加乘客">
	</form>
</body>
</html>