<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编辑旅客</title>
</head>

<body>
<script src="../laydate/laydate.js"></script>
<script>
		//执行一个laydate实例
		laydate.render({
			elem: '#test1' //指定元素
		});
	</script>
	<form action="${pageContext.request.contextPath }/travel/addTraveller" method="post">编辑旅客<br />
		用户护照号: <input type="text" name="passportNo" /><br />
		用户姓名:<input type="text" name="trName" /><br />
		性别:<select name="trSex">
			<c:forEach items="${sexList}" var="sl">
				<option value="${sl.idt_dic_sex }">${sl.dSex }</option>
			</c:forEach>
		</select><br />
		出生日期:<input type="text" id="test1" name="trBirthday"><br/>
		出生地:<input type="text" name="trBorAdd" /><br />
		国籍:<input type="text" name="trNation" /><br />
		旅行社:${travelName }(${legalNo})
		<br />
		<input type="hidden" value=${legalNo } readonly="readonly" name="legalNo">
		<input type="hidden" value=${travelName } readonly="readonly" name="travelName">
		<input type="submit" value="提交">
	</form>
</body>

</html>