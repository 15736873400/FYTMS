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


<title>Insert title here</title>
</head>
<body>
	<!-- angularjs区间范围 -->
	<div ng-app="myApp" ng-controller="myCtrl">
		<form action="${pageContext.request.contextPath }/post6/changeShiptime">
			<!-- 通过id跳转到函数监听器中 -->
			船次号:<input readonly="readonly" name="shiptimeNo" value="${list.shiptimeNo }"><br/>
			请选择船舷:<select name="shipNo">
				<option>请选择船舷</option>
				<c:forEach items="${sans}" var="sans">
					<option value="${sans.shipNo }">${sans.shipNo }(${sans.shipName }
						座位:${sans.seatNum})</option>
				</c:forEach>
			</select><br />
			原船舷:${list.shipNo }(${list.shipName } 座位:${list.seatNum})<br/>


			<!-- 绑定模型 -->
			请选择开始结束时间:<input type="text" id="bigDate" name="bigDate"
				ng-model="selectedDate" value="${bigDate }"><br />
				原时间:${start }--->${arr }<br/> 
			出发港口:<select name="startPort">
			<option>请选择</option>
				<c:forEach items="${sap}" var="sap">
					<option value="${sap.idt_dic_port }">${sap.dPort }</option>
				</c:forEach>
			</select> 
			到达港口:<select name="arrPort">
			<option>请选择</option>
			<c:set var="startIndex" value="${fn:length(persons)+1 }"></c:set>  
            <c:forEach var="person" items="${sap}" varStatus="status">  
			<option value="${sap[startIndex - status.index].idt_dic_port }">${sap[startIndex - status.index].dPort }</option>
				</c:forEach>
			</select><br />
			原地点:${list.startPort}--->${list.arrPort }<br />
			<!-- 唯一id -->
			请设置售票时间:<input type="text" id="sellTime" name="sellDate"><br />
			原售票时间:${sell }<br/>
			请设置票价:<input type="text" value="${list.price}" name="price"><br />


			<button type="submit">更改</button>
		</form>
	</div>
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