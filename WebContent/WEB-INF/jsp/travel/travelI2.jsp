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
	<title>设置票种</title>
</head>

<body>
	欢迎${travel.travelName }<br />
	工商登记号:${travel.legalNo }<br />
	账户余额:${travel.money }元<br />
	<script type="text/javascript">
		$(function () {
			$("#myTable").tablesorter();
		});
	</script>
	<table id="myTable" class="tablesorter" border="1">
		<thead>
			<tr>
				<th>信息</th>
				<th>导游设置</th>
				<th>票种设置</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="l" varStatus="loop">
				<tr>
					<td>${l}</td>
					<td>
						<form action="${pageContext.request.contextPath }/travel/teamNo2" method="post">
							<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
							<input type="hidden" value=${l } readonly="readonly" name="str">
							<input type="hidden" value=${shiptimeNo } readonly="readonly" name="shiptimeNo">
							<input type="hidden" value="导游" readonly="readonly" name="sign">
							<input type="hidden" value="${st }" readonly="readonly" name="st">
		                    <input type="hidden" value="${re }" readonly="readonly" name="re">
							<input type="submit" value="设为导游"></form>
					</td>
					<td>
						<form action="${pageContext.request.contextPath }/travel/teamNo2" method="post">
							<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
							<input type="hidden" value=${shiptimeNo } readonly="readonly" name="shiptimeNo">
							<select name="sign">
								<c:forEach items="${type}" var="type">
									<option value="${type.idt_dic_ticketType }">${type.dTicketType }</option>
								</c:forEach>
							</select>
							<input type="hidden" value="${st }" readonly="readonly" name="st">
		                    <input type="hidden" value="${re }" readonly="readonly" name="re">
							<input type="hidden" value=${l } readonly="readonly" name="str">
							<input type="submit" value="设置"></form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	${st }
	${re }
</body>

</html>