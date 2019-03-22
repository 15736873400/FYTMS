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
	<title>旅行社功能界面</title>
</head>

<body>
	欢迎${travel.travelName }<br />
	工商登记号:${travel.legalNo }<br />
	法人姓名:${travel.legalName }<br />
	法人手机号:${travel.legalPhone }<br />
	账户余额:${travel.money }元<br />
	退款金额:${travel.refund }元<br />
	<form action="${pageContext.request.contextPath }/travel/jumpChangePassword" method="post">
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<input type="submit" value="更改密码">
	</form>
	<form action="${pageContext.request.contextPath }/travel/weihuTraveller" method="post">
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<input type="submit" value="确认团成员／维护旅客">
	</form>
	<form action="${pageContext.request.contextPath }/travel/startT2" method="post">
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<input type="hidden" value="" readonly="readonly" name="Start">
		<input type="hidden" value="" readonly="readonly" name="Return">
<input type="hidden" value="" readonly="readonly" name="StartPort">
		<input type="submit" value="开始购票">
	</form>
	
	<%-- <form action="${pageContext.request.contextPath }/travel/searchTicket">
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<input type="submit" value="退票/打印">
	</form> --%>
</body>

</html>