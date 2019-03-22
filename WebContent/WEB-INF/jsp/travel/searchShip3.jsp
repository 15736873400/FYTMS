<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>查询船次</title>
</head>

<body>
	<script src="../laydate/laydate.js"></script>
	<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
	<script>
		//执行一个laydate实例
		laydate.render({
			elem: '#test1' //指定元素
		});
	</script>
	<script>
		//执行一个laydate实例
		laydate.render({
			elem: '#test2' //指定元素
				,type:'datetime'
		});
	</script>
	<form action="${pageContext.request.contextPath }/travel/jump" method="post">
		<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
		<input type="submit" value="返回">
	</form>
	欢迎${travel.travelName }<br />
	工商登记号:${travel.legalNo }<br />
	账户余额:${travel.money }元<br />
	<form action="${pageContext.request.contextPath }/travel/startT2" method="post">
		<input type="hidden" value=${travel.legalNo } name="legalNo">
		选择登船日期：<input type="text" id="test1" name="Start">
		<br />选择起始港口：<select name="StartPort">
			<option value="1">中方->俄方</option>
			<option value="2">俄方->中方</option>
		</select><br />
		选择返回日期：<input type="text" id="test2" name="Return">
		<input type="submit" value="查询">
	</form>
	<script type="text/javascript">
		$(function () {
			$("#myTable").tablesorter();
		});
	</script>
	 <table id="myTable" class="tablesorter" border="1">
		<thead>
			<tr>
				<th>往返</th>
				<th>船次</th>
				<th>出航时间</th>
				<th>返航时间</th>
				<th>开售时间</th>
				<th>票价</th>
				<th>剩余座位</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list" varStatus="loop">
				<tr>
					<td>${list.startPort }<--->${list.arrPort }</td>
					
					<td>${list.shiptimeNo }</td>
					<td style="color:green">${Start } ${startList[loop.count-1] }</td>
					<td style="color:orange">${arrList[loop.count-1] }</td>
					<td style="color:red">提前${list.sellTime }小时起售</td>
					<td>${list.price }元</td>
					<td>${list.sSeat }个</td>
					<td>
						<form action="${pageContext.request.contextPath }/travel/jumpTravelI" method="post">
							<input type="hidden" value=${travel.legalNo } readonly="readonly" name="legalNo">
							<input type="hidden" value=${list.shiptimeNo } readonly="readonly" name="shiptimeNo">
							<input type="hidden" value="${Start } ${startList[loop.count-1] }" readonly="readonly" name="startDate">
							<input type="hidden" value="${Return }" readonly="readonly" name="returnDate">
							<input type="submit" value="选择">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
</body>

</html>