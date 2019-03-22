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
	<form action="${pageContext.request.contextPath }/post6/addTravel">

		<input type="text" name="legalNo" placeholder="请输入工商号" />
		<input type="text" name="travelName" placeholder="请输入旅行社名" />
		<input type="text" name="legalName" placeholder="请输入法人姓名" />
		<input type="text" name="legalPhone" placeholder="请输入法人手机号" />
        <input type="text" name="money" placeholder="请输入余额" />

		<button type="submit">添加</button>
	</form>
	
</body>
</html>