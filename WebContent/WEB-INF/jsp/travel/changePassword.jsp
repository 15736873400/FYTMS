<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>更改密码</title>
</head>

<body>
<form action="${pageContext.request.contextPath }/travel/jump" method="post">
							<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
							<input type="submit" value="返回">
						</form>
	欢迎${travel.travelName }<br />
	工商登记号:${travel.legalNo }<br />
	账户余额:${travel.money }元<br />
	<form action="${pageContext.request.contextPath }/travel/changePassword" method="post">
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		输入要更改的密码:<input type="text" name="travelPassword" />
		<input type="submit" value="更改">
	</form>
</body>

</html>