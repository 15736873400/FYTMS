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
 
<script type="text/javascript" src="../LinkageSel-master/js/jquery.js"></script>
<script type="text/javascript" src="../LinkageSel-master/js/comm.js"></script>
<script type="text/javascript" src="../LinkageSel-master/js/linkagesel-min.js"></script> 


<script type="text/javascript" charset="UTF-8" src="../JAreaSelect-master/js/JAreaData.js"></script>
<script type="text/javascript" charset="UTF-8" src="../JAreaSelect-master/js/JAreaSelect.js"></script>
<script src="https://cdn.staticfile.org/angular.js/1.4.6/angular.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<!-- angularjs区间范围 -->
	<div ng-app="myApp" ng-controller="myCtrl">
		<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/post6/changeUser" >
			员工编号:<input type="text" readonly="readonly" value="${list.empNo }" name="empNo"><br /> 
			
			员工密码:${target}
			<button type="button" onclick="btn1()">修改</button>
			<div id="div1" style="background:#999999; display:none;">
			请输入修改的密码:<input
				type="text" name="empPassword" value="${target}"><br /> 
			</div>
			
			<br /> 员工姓名:${list.empName }
			<button type="button" onclick="btn2()">修改</button>
			<div id="div2" style="background:#999999; display:none;">
			请输入员工姓名:<input
				type="text" name="empName" value="${list.empName}">
			</div>
			
			
			<br /> 性别:${sex }
			<button type="button" onclick="btn3()">修改</button>
			<div id="div3" style="background:#999999; display:none;">
			请选择性别:<select
				name="empSex">
				<option value="0">请选择性别</option>
				<c:forEach items="${lSex}" var="lSex">
					<option value="${lSex.idt_dic_sex }">${lSex.dSex }</option>
				</c:forEach>
			</select>
			</div>
			
			<br /> 出生日期:${lBir }
			<button type="button" onclick="btn4()">修改</button>
			<div id="div4" style="background:#999999; display:none;">
			请选择出生日期:<input type="text" value="${lBir}" readonly="readonly" id="empBir"
				name="empBir">
			</div>
			
			
			<br /> 手机号:${list.empMobile }
			<button type="button" onclick="btn5()">修改</button>
			<div id="div5" style="background:#999999; display:none;">
			请输入手机号:<input type="text" value="${list.empMobile}"
				name="empMobile">
			</div>
			
			<br /> 地址:${list.empAddress }
			<button type="button" onclick="btn6()">修改</button>
			<div id="div6" style="background:#999999; display:none;">
			请选择地址:
			<div name="address1" id="area-select-box" ng-model="address1">
			</div> 
			请填写具体地址:<input type="text" ng-model="address2"> 
			</div>
			
			
			<br /> 职务岗位:${dept } - ${post }
			<button type="button" onclick="btn7()">修改</button>
			<div id="div7" style="background:#999999; display:none;">
			请选择具体岗位职务:<select id="deptPost" name="deptPost" ></select>
			</div>
				
			<br /> 照片:<img id="img1" height="80px" width="80px" src="../pic/${list.empNo }.png"/>
			<button type="button" id="btn8">修改</button>
			<div id="div8" style="background:#999999; display:none;">
			上传图片:<input type="file" id="file" name="cfile" onchange="previewImg(this, 'img1')" />
			</div>	
			
			
				<input type="hidden" value="{{address}}" name="empAddress">
				<input type="hidden" value="{{dept}}" name="empDept">
				<input type="hidden" value="{{post}}" name="empPost">
				<input type="hidden" value="{{pic}}" name="empState">
				
				<br /> <input type="submit" value="提交" id="mouse">
				 </form>
	</div>

<script>
// 预览＋文件类型和大小判定
function previewImg(file, imgId){
	if(file.value==""){
		alert("请选择文件");
		return;
	}
	var img = document.getElementById(imgId);
	if (file.files && file.files[0]) {
			/* s = res; */
			console.log(file.files[0].type);
			if((file.files[0].type=="image/jpeg") || (file.files[0].type=="image/png"))
				{
				size = file.files[0].size/1024/1024;
				console.log(size);
				if(size>=0.5)
				{
				alert("图片大小为"+size.toFixed(2)+"M,请选择小于500kb的图片!");
				file.value = '';
				img.src="";
				return false;
				}
				else
					{
					var reader = new FileReader();
					reader.readAsDataURL(file.files[0]);
					reader.onload = function(evt){
						var reg = /^data:base64,/;
						var res = evt.target.result;
						if(reg.test(res)){
							res = res.replace(reg, "data:"+file.files[0].type+";base64,");
						}
					img.src = res;
					p="1";//成功更改图片后的标志
					};
					}	
		}
		else
		{
		alert("请选择格式为jpg或png的图片!");
		file.value = '';
		img.src="";
		return false;
		}
	} 
	else {
		alert("请选择文件");
		img.src = file.value;
	}
}

	var a="";
	var p="0";
	var dp="0";
	//显示隐藏div
	function btn1(){
		/* document.getElementById('div1').style.display='block'; */
		$("#div1").show();	
	}

	function btn2(){
		$("#div2").show();
	}
	function btn3(){
		$("#div3").show();
	}
	function btn4(){
		$("#div4").show();
	}
	function btn5(){
		$("#div5").show();
	}
	function btn6(){
		$("#div6").show();
		a="1";
	}
	function btn7(){
		$("#div7").show();
		dp="1";
	}
	
	var app = angular.module('myApp', [])
	app.controller('myCtrl', function($scope, $rootScope) {
		$scope.address1=area.getAreaString();
		$scope.address2="";
		$scope.deptPost="";
		$scope.dept="${list.empDept}";//初始值
		$scope.post="${list.empPost}";//初始值
		$scope.address="${list.empAddress}";//初始值
		$scope.pic="0";//判定是否上传图片
		
		var dgebi2 = document.getElementById('btn8');//监听id
		dgebi2.addEventListener('click', deptPost2);//所有隐藏值赋值
	    function deptPost2(){
	    	$("#div8").show();
	    	};
		
/* 选择生日 */
		var bir = laydate.render({
			elem : '#empBir',
			type : 'date',
			btns : [ 'confirm' ],//只显示确认
		});
		
		
		
	/* 多级联动  */
	 $(document).ready(function(){
		    var data1 = {
		    		1: {name: '船舷', 
		            	cell: { 
		            		1: {name: '船长'}, 
		            		2: {name: '轮机长'},
		            		3: {name:'船员'}
		            		}
		            },
		            2: {name: '售票窗口', 
		                cell: { 
		                	4: {name: '售票员'}, 
		            		5: {name: '检票员'}
		                    }
		                }        
		    };
		    var opts = {
		            data: data1,
		            select: '#deptPost',
		             defVal:[${list.empDept}-1,${list.empPost}-1],//初始值 
		              head:false  
		           /*  loaderImg:images/ui-anim_basic_16x16.gif */
		    };
		    var linkageSel1 = new LinkageSel(opts);
		     
		   
		    //点击提交完成截取操作
		    var dgebi = document.getElementById('mouse');//监听id
			dgebi.addEventListener('mouseover', deptPost);//所有隐藏值赋值
		    function deptPost(){
		    	$scope.$apply(function(){
		    		$scope.pic=p;	//判定是否上传图片
		        }); 
		    	$scope.$apply(function(){
		    	if(a == "1")//判定是否打开div
		    		{
				$scope.address=area.getAreaString()[0]+area.getAreaString()[1]+area.getAreaString()[2]+$scope.address2;//选的地区拼接
				console.log($scope.address);
		    		}
		    	if(dp=="1")//判定是否打开div
		    		{
		    		$scope.dept=linkageSel1.getSelectedArr()[0];//选的职务
			    	$scope.post=linkageSel1.getSelectedArr()[1];
		    		}
		    	})
		    	console.log("$scope.pic="+$scope.pic);
		    	console.log("$scope.dept="+$scope.dept);
		    	console.log("$scope.post="+$scope.post);
		    	console.log("$scope.address="+$scope.address);
		    }   
		});	
	});
	
	var area = $("#area-select-box").JAreaSelect({
   	    prov : 1,
   	    city : 72,
   	    dist : 2839,
   });
    </script> 
</body>
</html>