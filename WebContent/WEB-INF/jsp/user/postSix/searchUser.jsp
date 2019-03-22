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
	 <form action="${pageContext.request.contextPath }/post6/searchUser">
        <select name="empState">
				<option value="0">员工编号</option>
				<option value="1">员工姓名</option>
		</select>
		<input type="text" name="empNo" placeholder="请输入员工编号／员工姓名" />
		<button type="submit">查找</button>
	</form>
	<a href="${pageContext.request.contextPath }/post6/jumpAddUser">
		<button type="submit">新增员工</button>
	</a>

	<script type="text/javascript">
		$(function() {
			$("#myTable").tablesorter();
		});
	</script>


	<table id="myTable" class="tablesorter" border="1">
		<thead>
			<tr>
				<th>员工编号</th>
				<!-- <th>密码</th> -->
				<th>员工姓名</th>
				<th>性别</th>
				<th>出生日期</th>
				<th>手机</th>
				<th>家庭地址</th>
				<th>岗位</th>
				<th>职务</th>
				<th>照片</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list" varStatus="loop">
				<tr>
				    <td>${list.empNo }</td>
					<%-- <td>${list.empPassword}</td> --%>
					<td>${list.empName }</td>
					<%-- <td>${startList[loop.count-1] }</td> --%>
					<td>${lSex[loop.count-1]}</td>
					<td>${lBir[loop.count-1]}</td>
					<td>${list.empMobile}</td>
					<td>${list.empAddress }</td>
					<td>${lDept[loop.count-1]}</td>
					<td>${lPost[loop.count-1]}</td>
					<td><img height="80px" width="80px" alt="No.${list.empNo }"
			src="../pic/${list.empNo }.png"> 
			<%-- <button type="button" onclick="previewImg(${list.empNo })">显示</button>
			<img id=${list.empNo } height="80px" width="80px"/> --%></td>
					<td>
						<form
							action="${pageContext.request.contextPath }/post6/jumpChangeUser">
							<input type="hidden" name="empNo" value="${list.empNo}"> <input
								type="submit" value="修改">
						</form>
						<form
							action="${pageContext.request.contextPath }/post6/deleteUser">
							<input type="hidden" name="empNo" value="${list.empNo}"> <input
								type="submit" value="删除">
						</form>
						<form
							action="${pageContext.request.contextPath }/post6/showUser">
							<input type="hidden" name="empNo" value="${list.empNo}"> <input
								type="submit" value="查询">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table> 
	<%-- ${list } --%>
	<%-- <c:forEach items="${list}" var="list" varStatus="loop">
		<img height="80px" width="80px" alt="No.${list.empNo }"
			src="../pic/${list.empNo }.png">
		<br />
	</c:forEach> --%>
	<!-- <script>

function previewImg(imgId){
	console.log("show");
	var img = document.getElementById(imgId);
	res="../pic/"+imgId+".png"
				img.src = res;
	console.log("show"+res);
}
</script> -->
</body>

</html>