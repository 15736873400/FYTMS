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
		<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/post6/addUser" >
			请输入员工编号:<input type="text" name="empNo"><br /> 
			请输入密码:<input
				type="text" name="empPassword"><br /> 
			请输入员工姓名:<input
				type="text" name="empName"><br /> 
			请选择性别:<select
				name="empSex">
				<c:forEach items="${lSex}" var="lSex">
					<option value="${lSex.idt_dic_sex }">${lSex.dSex }</option>
				</c:forEach>
			</select><br /> 
			请选择出生日期:<input type="text" readonly="readonly" id="empBir"
				name="empBir"><br /> 
			请输入手机号:<input type="text"
				name="empMobile"><br />
			请选择地址:
			<div name="address1" id="area-select-box" ng-model="address1"></div> 
			请填写具体地址:<input type="text" ng-model="address2"> <br/>
			<input type="hidden" value="{{address}}" name="empAddress">
			<%-- 请选择岗位:<select name="empDept">
				<c:forEach items="${lDept}" var="lDept">
					<option value="${lDept.idt_dic_dept }">${lDept.dDept }</option>
				</c:forEach>
			</select><br /> 
			请选择职务:<select name="empPost">
				<c:forEach items="${lPost}" var="lPost">
					<option value="${lPost.idt_dic_post }">${lPost.dPost }</option>
				</c:forEach>
			</select><br />  --%>
			 请选择具体岗位职务:<div><select id="deptPost" name="deptPost" ng-model="dept"></select></div>
				<input type="hidden" value="{{dept}}" name="empDept">
				<input type="hidden" value="{{post}}" name="empPost">
				上传图片:<input type="file" id="file1" name="cfile" onchange="previewImg(this, 'img1')" />
				<img id="img1" height="80px" width="80px"/><br/>
				<input type="submit" value="提交" id="mouse">
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
</script>
	<script>
	var app = angular.module('myApp', [])
	app.controller('myCtrl', function($scope, $rootScope) {
		$scope.address1=area.getAreaString();
		$scope.address2="";
		$scope.deptPost="";
		$scope.dept="";
		$scope.post="";
	
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
		            /* defVal:[1,10], */
		            head:false
		           /*  loaderImg:images/ui-anim_basic_16x16.gif */
		    };
		    var linkageSel1 = new LinkageSel(opts);
		     
		    /* $('#getSelectedValue').click(function() {
		        var v = linkageSel1.getSelectedArr()[0];
		        var v2 = linkageSel1.getSelectedArr()[1];
		        alert(v+v2);
		    }); */
		    //点击提交完成截取操作
		    var dp = document.getElementById('mouse');//监听id
			dp.addEventListener('click', deptPost);//所有隐藏值赋值
		    function deptPost(){
		    	$scope.$apply(function(){
		    	$scope.dept=linkageSel1.getSelectedArr()[0];//选的职务
		    	$scope.post=linkageSel1.getSelectedArr()[1];
		    	console.log($scope.deptPost);
		    	console.log($scope.post);
		    	console.log($scope.dept);
				$scope.address=area.getAreaString()[0]+area.getAreaString()[1]+area.getAreaString()[2]+$scope.address2;//选的地区拼接
				console.log($scope.address);
		    	})
		    }
		     
		   
		});
		
		
		
		
	});
	var area = $("#area-select-box").JAreaSelect({
   	    prov : 1,
   	    city : 72,
   	    dist : 2839,
   });
	 
    </script> 
    
 <%-- <form action="${pageContext.request.contextPath }/post6/addUser" method="post" enctype="multipart/form-data"> 
			上传图片:<input type="file" name="cfile"><br/>
				<input type="submit" value="提交" id="mouse">
		</form>   --%>


</body>
</html>