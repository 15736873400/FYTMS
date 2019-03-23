<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script  type="text/javascript" src="../../../jquery-qrcode/jquery.js"></script>
<script  type="text/javascript" src="../../../jquery-qrcode/jquery.qrcode.min.js"></script>
<script type="text/javascript">
$(function(){
    $('.ewm').qrcode({
        //render: "table", //table方式  */
        width: 100, //宽度 
        height:100, //高度 
        text: "${sl.tickNo}", //任意内容 
        background :"#ffffff",//背景颜色  
        foreground :"#000000" //前景颜色  
    });
    
    })
  </script>
<!--   <script type="text/javascript">
  function  printPage(){   
	  var newWin=window.open('about:blank', '', '');   
	  var titleHTML=document.getElementById("doctitle").innerHTML;   
	  newWin.document.write(titleHTML);   
	  newWin.document.location.reload();   
	  newWin.print();   
	}  
   
    </script> -->
   <script type="text/javascript"> 
   function print(dom){
   var body = document.body.innerHTML;//先獲取當前頁的html代碼
       document.body.innerHTML = document.querySelector(dom).innerHTML;//需要打印的頁面
       window.print();
       document.body.innerHTML =body;//打印完成之後，還原界面}
       </script>
<%--   <div class="ewm"></div><br/>

购票日期:${tickDate} <br/>
${sl.startPort}  ---${sl.shipNo}--> ${sl.arrPort }<br/>
${startTime }开   预计${arrTime }到达<br/>

${c}--${sl.trName}--${sl.guide } <br/>

旅行社:${sl.travelName} --%>

<!-- <div id="doctitle"> -->
<div class="page">
<table border="2" bordercolor="black" width="300" cellspacing="0" cellpadding="5">
        <tr>
            <td rowspan="2" class="ewm" ></td>
            <td >购票日期:${tickDate}</td>
            <!--<td>1.3</td>-->
        </tr>
        <tr>
            <td >${c}--${sl.trName}--${sl.guide }</td>
        <tr>
            <td colspan="2">${sl.startPort}  -->${sl.shipNo}--> ${sl.arrPort }</td>
        <tr>
        <tr>
        <td colspan="2">${startTime }开   预计${arrTime }到达</td>
        </tr>
        
            
        <tr><td>旅行社:${sl.travelName}</td>
        <td><a href= "javascript:;" onclick= "print()">FYTMS</a></td>
        </tr>
    </table>

</div>
 




</body>
</html>