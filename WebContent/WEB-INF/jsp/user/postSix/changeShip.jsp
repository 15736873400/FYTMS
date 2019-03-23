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
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css" />	
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/chosen.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/datepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/daterangepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/colorpicker.css" />
<!-- fonts -->
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
<!-- ace styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/ace.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/ace-skins.min.css" />		
<!-- inline styles related to this page -->
<!-- ace settings handler -->
<script src="${pageContext.request.contextPath }/assets/js/ace-extra.min.js"></script>	
<title>Insert title here</title>
</head>
<body>
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try {
					ace.settings.check('main-container', 'fixed')
				} catch (e) {}
			</script>
			<div class="main-container-inner">		
				<div class="page-content">	
				<div class="page-header">
					</div> <!-- /.page-header -->				
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="space-4"></div>
							<div class="space-4"></div>
							<div class="space-4"></div>
	<%-- <form  class="form-horizontal" action="${pageContext.request.contextPath }/post6/changeShip">

		船舷号<input type="text" readonly="readonly" name="shipNo" value=${list.shipNo } /><br/>
		请输入船名<input type="text" name="shipName" value=${list.shipName }  /><br/>
		请输入定员<input type="text" name="seatNum" value=${list.seatNum }  /><br/>
		请选择船只状态<select name="shipState">
			<c:forEach items="${st}" var="st">
				<option value="${st.idt_dic_shipstate }">${st.dShipstate }</option>
			</c:forEach>
		</select><br/>
		<button type="submit">修改</button>
	</form> --%>
	
	<form  class="form-horizontal" action="${pageContext.request.contextPath }/post6/changeShip">
	                           <div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"  > 船舷号 </label>
									<div class="col-sm-9">
										<input  type="text" readonly="readonly" name="shipNo" value=${list.shipNo }  class="col-xs-10 col-sm-5" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入船名 </label>
									<div class="col-sm-9">
										<input type="text" name="shipName" value=${list.shipName }  class="col-xs-10 col-sm-5" />
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请输入定员</label>
									<div class="col-sm-9">
										<input type="text" name="seatNum" value=${list.seatNum } class="col-xs-10 col-sm-5" />
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
						<a class="btn"  href="/FYTMS/post6/searchShip"><i class="icon-undo bigger-110"></i>Return</a>			
									</div>
								</div>
							</form>	
	
	
	
	<%@include file="addtable2.jsp" %>		
</body>
</html>




