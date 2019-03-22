<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>登陆</title>
</head>

<body>
	<form action="${pageContext.request.contextPath }/login/login" method="post">
		账号/密码错误!<br/>
		请选择身份
		<select name="selectNo">
			<option value="2">旅行社</option>
			<option value="1">工作人员</option>
		</select>
		<input type="text" name="name" placeholder="请输入帐号" />
		<input type="password" name="password" placeholder="请输入密码" />
		<button type="submit">Login</button>
	</form>
</body>

</html>