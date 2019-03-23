<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../laydate/laydate.js"></script>
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
					<form class="form-horizontal"   action="${pageContext.request.contextPath }/post6/changeTravel">
<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1" >工商号</label>
									<div class="col-sm-9">
										<input type="text" readonly="readonly" name="legalNo" value=${list.legalNo } /><br/>
									</div>
								</div>
<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1" > 请输入旅行社名 </label>
									<div class="col-sm-9">
										<input type="text" name="travelName" value=${list.travelName }  /><br/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1" > 请输入法人姓名 </label>
									<div class="col-sm-9">
										<input type="text" name="legalName" value=${list.legalName }  /><br/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1" >请输入法人手机号</label>
									<div class="col-sm-9">
										<input type="text" name="legalPhone" value=${list.legalPhone }  /><br/>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1" > 请输入余额</label>
									<div class="col-sm-9">
										<input type="text" name="money" value=${list.money }  /><br/>
									</div>
								</div>
		<div class="col-md-offset-3 col-md-9">
										<button class="btn btn-info" type="submit">
											<i class="icon-ok bigger-110"></i>
											Submit
										</button>
										<!-- &nbsp; &nbsp; &nbsp; -->
										<a class="btn"  href="/FYTMS/post6/searchTravel"><i class="icon-undo bigger-110"></i>Return</a>			
								</div>	
	</form>		
						
		
	
		
		
<%@include file="addtable3.jsp" %>
<script>
	var app = angular.module('myApp', [])
	app.controller('myCtrl', function($scope, $rootScope) {
		$scope.selectedDate = '${bigDate }';
		/*  console.log($scope.selectedDate ); */
		var starttime = new Date();//起始时间初始化 获取当前日期
		var arrtime = new Date();

		var now = new Date();//当前时间
		
		
		
		var change = document.getElementById('bigDate');//监听id
		change.addEventListener('mousedown', changeTo);//鼠标按下跳转到方法中
		function changeTo() {
			console.log("跳转到changeTo");
			test.config.min = {
				year : now.getFullYear(),
				month : now.getMonth(),
				date : now.getDate(),
				hours : now.getHours(),
				minutes : now.getMinutes(),
				seconds : now.getSeconds()
			}
		}

		var test = laydate.render({
			elem : '#bigDate',
			type : 'datetime',//可以选择时间
			range : true,
			 done : function(value) {
				$scope.$apply(function() {
					$scope.selectedDate = value;
				})
			}  
		});

		var changeSell = document.getElementById('sellTime');//监听id
		changeSell.addEventListener('mousedown', changeSellTime);//跳转到方法中
		function changeSellTime() {
			console.log("跳转到changeSellTime");
			//当前日期转化为字符串
			$scope.start = starttime.getFullYear() + '-'
					+ (starttime.getMonth() + 1) + '-'
					+ starttime.getDate() + ' ' + starttime.getHours()
					+ ':' + starttime.getMinutes() + ':'
					+ starttime.getSeconds();
			//截取时间
			$scope.arr = String($scope.selectedDate).substring(0, 19);

			var arr = String($scope.selectedDate).substring(0, 19);

			//字符串放到date中
			arrtime = new Date(String(arr).substring(0, 4), String(arr)
					.substring(5, 7) - 1, String(arr).substring(8, 10),
					String(arr).substring(11, 13), String(arr)
							.substring(14, 16));
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