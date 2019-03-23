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
	<form action="${pageContext.request.contextPath }/post6/addTravel">

		<input type="text" name="legalNo" placeholder="请输入工商号" />
		<input type="text" name="travelName" placeholder="请输入旅行社名" />
		<input type="text" name="legalName" placeholder="请输入法人姓名" />
		<input type="text" name="legalPhone" placeholder="请输入法人手机号" />
        <input type="text" name="money" placeholder="请输入余额" />

		<button type="submit">添加</button>
	</form>
	
</body>
</html>  --%>

<!-- <!DOCTYPE html> 111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111-->
<html lang="en">
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
<%@include file="addtable1.jsp" %>
							<form class="form-horizontal"  action="${pageContext.request.contextPath }/post6/addTravel">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"  > 请输入工商号 </label>
									<div class="col-sm-9">
										<input  name="legalNo" type="text" id="form-field-1" placeholder="请输入工商号" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入旅行社名 </label>
									<div class="col-sm-9">
										<input  name="travelName" type="text" id="form-field-1" placeholder="请输入旅行社名" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1" > 请输入法人姓名 </label>
									<div class="col-sm-9">
										<input name="legalName" type="text" id="form-field-1" placeholder="请输入法人姓名" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入法人手机号 </label>
									<div class="col-sm-9">
										<input name="legalPhone" type="text" id="form-field-1" placeholder="请输入法人手机号" class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-2">请输入余额 </label>
									<div class="col-sm-9">
										<input name="money" type="text" id="form-field-2" placeholder="请输入余额" class="col-xs-10 col-sm-5" />
										<span class="help-inline col-xs-12 col-sm-7">
										</span>
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
										<a class="btn"  href="/FYTMS/post6/jumpAddTravel"><i class="icon-undo bigger-110"></i>Reset</a>			
									</div>
								</div>
							</form>	
<%@include file="addtable2.jsp" %>							
	</body>
	
</html>
