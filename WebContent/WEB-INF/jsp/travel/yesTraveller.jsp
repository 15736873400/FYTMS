<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>确认信息</title>
</head>

<body>
	确认信息:<br />
	护照号:${dtb.passportNo }<br />
	姓名:${dtb.trName }<br />
	性别：${dtb.dSex }<br />
	出生日期：${dtb.trBirthday }<br/>
	出生地：${dtb.trBorAdd }<br />
	国籍：${dtb.trNation }<br />
	旅行社：${dtb.travelName }(${dtb.trTravel } )<br />
	<form action="${pageContext.request.contextPath }/travel/addT" method="post">
		<input type="hidden" value=${dtb.trTravel } readonly="readonly" name="legalNo">
		<input type="hidden" value=${dtb.passportNo } readonly="readonly" name="passportNo">
		<input type="submit" value="确认">
	</form>
	<form action="${pageContext.request.contextPath }/travel/cancel" method="post">
		<input type="hidden" value=${dtb.trTravel } readonly="readonly" name="legalNo">
		<input type="submit" value="取消">
	</form>
</body>

</html>