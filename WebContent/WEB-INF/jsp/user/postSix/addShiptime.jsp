<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../laydate/laydate.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
<script src="https://cdn.staticfile.org/angular.js/1.4.6/angular.min.js"></script>
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
	<!-- angularjs区间范围 -->
	 <%-- <div ng-app="myApp" ng-controller="myCtrl">
		<form action="${pageContext.request.contextPath }/post6/addShiptime">
			<!-- 通过id跳转到函数监听器中 -->
			请选择船舷:<select name="shipNo" id="change">
				<option>请选择船舷</option>
				<c:forEach items="${sans}" var="sans">
					<option value="${sans.shipNo }">${sans.shipNo }(${sans.shipName }
						座位:${sans.seatNum})</option>
				</c:forEach>
			</select><br />


			<!-- 绑定模型 -->
			请选择开始结束时间:<input type="text" readonly="readonly" id="bigDate" name="bigDate"
				ng-model="selectedDate"><br /> 
				
			出发港口:<select name="startPort">
				<c:forEach items="${sap}" var="sap">
					<option value="${sap.idt_dic_port }">${sap.dPort }</option>
				</c:forEach>
			</select> 
			
			到达港口:<select name="arrPort">
							<c:forEach items="${sap}" var="sap">
					<option value="${sap.idt_dic_port }">${sap.dPort }</option>
				</c:forEach>
			</select>
				<c:set var="startIndex" value="${fn:length(persons)+1 }"></c:set>
				<c:forEach var="person" items="${sap}" varStatus="status">
					<option value="${sap[startIndex - status.index].idt_dic_port }">${sap[startIndex - status.index].dPort }</option>
				</c:forEach>
			</select> <br />
			<!-- 唯一id -->
			请设置售票时间:<input type="text" readonly="readonly" id="sellTime" name="sellDate"><br />
			请设置票价:<input type="text" name="price"><br />


			<button type="submit">添加</button>
		</form>
	</div>  --%>
	
	
	<div class="main-container" id="main-container"  ng-app="myApp" ng-controller="myCtrl">
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
							
							
	<form  class="form-horizontal" action="${pageContext.request.contextPath }/post6/addShiptime" >
	
	
		<!-- 通过id跳转到函数监听器中 -->
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1" > 请选择船舷 </label>
									<div class="col-sm-9">
										<!-- <input name="empNo" type="text" id="form-field-1" placeholder="请输入员工编号" class="col-xs-10 col-sm-5" /> -->
									    <select name="shipNo" id="change">
				                        <option>请选择船舷</option>
				                        <c:forEach items="${sans}" var="sans">
					                    <option value="${sans.shipNo }">${sans.shipNo }(${sans.shipName }
						                                座位:${sans.seatNum})</option>
				                        </c:forEach>
			                            </select>
								     </div>
								</div>
			<!-- 绑定模型 -->				
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请选择开始结束时间 </label>
									<div class="col-sm-9">
									<input type="text" readonly="readonly" id="bigDate" name="bigDate" ng-model="selectedDate">
										<!-- <input  name="empPassword" type="text" id="form-field-1" placeholder="请输入密码" class="col-xs-10 col-sm-5" /> -->
									</div>
								</div>
								
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1" > 出发港口 </label>
									<div class="col-sm-9">
									<select name="startPort">
				                    <c:forEach items="${sap}" var="sap">
					                <option value="${sap.idt_dic_port }">${sap.dPort }</option>
				                    </c:forEach>
			                        </select> 
										<!-- <input name="empName" type="text" id="form-field-1" placeholder="请输入员工姓名" class="col-xs-10 col-sm-5" /> -->
									</div>
								</div>
															
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1" >到达港口 </label>
									<div class="col-sm-9">
									<select name="arrPort">
				                    <c:set var="startIndex" value="${fn:length(persons)+1 }"></c:set>
				                    <c:forEach var="person" items="${sap}" varStatus="status">
					                <option value="${sap[startIndex - status.index].idt_dic_port }">${sap[startIndex - status.index].dPort }</option>
				                    </c:forEach>
			                        </select>
										<!-- <input name="empName" type="text" id="form-field-1" placeholder="请输入员工姓名" class="col-xs-10 col-sm-5" /> -->
									</div>
								</div>
								
								<!-- 唯一id -->												
								<div class="form-group">
									<label  class="col-sm-3 control-label no-padding-right" for="form-field-2">请设置售票时间 </label>
									<div class="col-sm-9" >
									<input type="text" readonly="readonly" id="sellTime" name="sellDate">
								</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1" > 请设置票价 </label>
									<div class="col-sm-9">
										<input name="price" type="text" id="form-field-1" placeholder="请设置票价" class="col-xs-10 col-sm-5" />
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
	
	
	
	<%@include file="addtable3.jsp" %>
	<script>
	var app = angular.module('myApp', [])
	app.controller('myCtrl', function($scope, $rootScope) {
		$scope.selectedDate = '';
		var starttime = new Date();//起始时间初始化 获取当前日期
		var arrtime = new Date();

		var now = new Date();//当前时间
		var change = document.getElementById('bigDate');//监听id
		change.addEventListener('mousedown', changeTo);//跳转到方法中 
		function changeTo() {
			console.log("跳转到changeTo");
			test.config.min = {
				year : now.getFullYear(),
				month : now.getMonth(),
				date : now.getDate()
				/* ,
			     hours : now.getHours(),
				minutes : now.getMinutes(),
				seconds : now.getSeconds()  */
			}
			console.log(test.config.min);
			console.log(test.config);
		}

		var test = laydate.render({
			elem : '#bigDate',
			type : 'datetime',//可以选择时间
			range : true,
			done : function(value) {
				$scope.$apply(function() {
					console.log("进入时间");
					$scope.selectedDate = value;
					//当前日期转化为字符串
					$scope.start = starttime.getFullYear() + '-'
							+ (starttime.getMonth() + 1) + '-'
							+ starttime.getDate() + ' ' + starttime.getHours()
							+ ':' + starttime.getMinutes() + ':'
							+ starttime.getSeconds();
					//截取时间
					$scope.arr = String(value).substring(0, 19);

					var arr = String(value).substring(0, 19);

					//字符串放到date中
					arrtime = new Date(String(arr).substring(0, 4), String(arr)
							.substring(5, 7) - 1, String(arr).substring(8, 10),
							String(arr).substring(11, 13), String(arr)
									.substring(14, 16));
					if(arrtime<starttime)
					{
						$scope.selectedDate='';
					alert("请输入"+$scope.start+"之后的日期");
					/* location.reload(); */
					$scope.start="";
					 $scope.arr="";
					
					
					}
					
					//设置下个方法中日期区间并逐个赋值
					ins22.config.min = {
						year : starttime.getFullYear(),
						month : starttime.getMonth(),
						date : starttime.getDate(),
						hours : starttime.getHours(),
						minutes : starttime.getMinutes(),
						seconds : starttime.getSeconds()
					}
					ins22.config.max = {
						year : arrtime.getFullYear(),
						month : arrtime.getMonth(),
						date : arrtime.getDate(),
						hours : arrtime.getHours(),
						minutes : arrtime.getMinutes(),
						seconds : 0
					}
					
				})
			}
		});

		document.getElementById('sellTime').onclick = function () {
			if($scope.selectedDate=="")
			  document.getElementById('bigDate').value = "";
			}
		var ins22 = laydate.render({
			elem : '#sellTime',
			type : 'datetime',
			btns : [ 'confirm' ],//只显示确认
			ready : function() {
				ins22.hint('日期可选值设定在<br>' + $scope.start + '到' + $scope.arr);
			}
		});
	});	
</script>

</body>
</html>