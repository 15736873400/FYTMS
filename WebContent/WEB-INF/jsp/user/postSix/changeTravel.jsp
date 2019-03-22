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
	<form action="${pageContext.request.contextPath }/post6/changeTravel">

		工商号<input type="text" readonly="readonly" name="legalNo" value=${list.legalNo } /><br/>
		请输入旅行社名<input type="text" name="travelName" value=${list.travelName }  /><br/>
		请输入法人姓名<input type="text" name="legalName" value=${list.legalName }  /><br/>
		请输入法人手机号<input type="text" name="legalPhone" value=${list.legalPhone }  /><br/>
        请输入余额<input type="text" name="money" value=${list.money }  /><br/>
		<button type="submit">修改</button>
	</form>
	
</body>
</html>