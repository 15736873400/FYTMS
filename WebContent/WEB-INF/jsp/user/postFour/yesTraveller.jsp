<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
确认信息:<br/>
护照号:${dtb.passportNo }<br/>
姓名:${dtb.trName }<br/>
性别：${dtb.dSex }<br/>
联系方式：${dtb.trPhone }<br/>
旅行社：${dtb.travelName }<br/>
	<a
		href="${pageContext.request.contextPath }/post4/searchAllShip/${dtb.passportNo }">
		<input type="submit" value="开始订购">
	</a>
</body>
</html>