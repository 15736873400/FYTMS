<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<%-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/post6/addShip">

		<input type="text" name="shipNo" placeholder="请输入船号" /><br/>
		<input type="text" name="shipName" placeholder="请输入船名" /><br/>
		<input type="text" name="seatNum" placeholder="请输入定员" /><br/>
		请选择船只状态:<select name="shipState">
			<c:forEach items="${st}" var="st">
				<option value="${st.idt_dic_shipstate }">${st.dShipstate }</option>
			</c:forEach>
		</select><br/>

		<button type="submit">添加</button>
	</form>
	
</body>
</html> --%>

<html lang="en">
<%@include file="addtable1.jsp" %>
<form class="form-horizontal"   action="${pageContext.request.contextPath }/post6/addShip">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"  > 请输入船号 </label>
									<div class="col-sm-9">
										<input  name="shipNo" type="text" id="form-field-1" placeholder="请输入船号" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入船名 </label>
									<div class="col-sm-9">
										<input  name="shipName" type="text" id="form-field-1" placeholder="请输入船名" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入定员</label>
									<div class="col-sm-9">
										<input name="seatNum" type="text" id="form-field-1" placeholder="请输入定员" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1">请选择船只状态</label>
									<div class="col-sm-9">
										<select name="shipState">
			                             <c:forEach items="${st}" var="st">
				                         <option value="${st.idt_dic_shipstate }">${st.dShipstate }</option>
			                            </c:forEach>
		                              </select>
									</div>
								</div>	
									
								<div class="space-4"></div>
								<div class="space-4"></div>
								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
										<button class="btn btn-info" type="submit">
											<i class="icon-ok bigger-110"></i>
											Submit
										</button>
										<!-- &nbsp; &nbsp; &nbsp; -->
										<a class="btn"  href="/FYTMS/post6/jumpAddShip"><i class="icon-undo bigger-110"></i>Reset</a>			
									</div>
								</div>
							</form>	
<%@include file="addtable2.jsp" %>			
	</body>
	
</html>

