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
	<title>设置状态</title>
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
				<th>是否是导游</th>
				<th>状态</th>
				<th>设置导游</th>
				<th>调整状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="l" varStatus="loop">
				<tr>
					<td>${l.passportNo}</td>
					<td>${l.isGuide}</td>
					<td>${l.dTicketType}</td>
					<td>
						<form action="${pageContext.request.contextPath }/travel/teamNo2" method="post">
							<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
							<input type="hidden" value=${l.passportNo } readonly="readonly" name="str">
							<input type="hidden" value=${shiptimeNo } readonly="readonly" name="shiptimeNo">
							<input type="hidden" value="${st }" readonly="readonly" name="st">
		                    <input type="hidden" value="${re }" readonly="readonly" name="re">
							<input type="hidden" value="导游" readonly="readonly" name="sign">
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
							<input type="hidden" value=${l.passportNo } readonly="readonly" name="str">
							<input type="submit" value="设置"></form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	总价:${money }元<br />
	<form action="${pageContext.request.contextPath }/travel/pay" method="post">
		<input type="hidden" value=${shiptimeNo } readonly="readonly" name="shiptimeNo">
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<input type="hidden" value=${money } readonly="readonly" name="money">
		<input type="hidden" value="${st }" readonly="readonly" name="st">
		<button type="submit">支付成团</button>
	</form>
</body>

</html>