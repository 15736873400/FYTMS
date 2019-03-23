<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul class="nav nav-list">
					  <li class="active"> <a href="#"> <em class="icon-dashboard"></em> <span class="menu-text"> 当前页面  </span> </a> </li>
					 
					  <li>
					  <a href="${pageContext.request.contextPath }/post6/searchTravel" class="dropdown-toggle">
					   <em class="icon-list"></em> 
					   <span class="menu-text"> 旅行社资料维护 </span> 
					   <strong class="arrow icon-angle-down"></strong> 
					  </a>
						  <ul class="submenu">
								<li>
									<a href="${pageContext.request.contextPath }/post6/searchTravel">
										<i class="icon-double-angle-right"></i>
										旅行社资料维护
									</a>
								</li>

								<li>
									<a href="${pageContext.request.contextPath }/post6/searchShip">
										<i class="icon-double-angle-right"></i>
										 船只资料维护 
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath }/post6/searchShiptime">
										<i class="icon-double-angle-right"></i>
										 航线船次信息维护 
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath }/post6/searchUser">
										<i class="icon-double-angle-right"></i>
										 员工信息维护 
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath }/post6/searchTraveller">
										<i class="icon-double-angle-right"></i>
										 散客资料维护
									</a>
								</li>
							</ul>
					  </li>

						<li>
							<a href="${pageContext.request.contextPath }/post4/searchTraveller" class="dropdown-toggle">
								<i class="icon-list"></i>
								<span class="menu-text"> 窗口售票 </span>

								<b class="arrow icon-angle-down"></b>
							</a>
						</li>

						<li><a href="${pageContext.request.contextPath }/post5/checkTicket" class="dropdown-toggle"> <i class="icon-list"></i><span class="menu-text"> 检票 </span> <strong class="arrow icon-angle-down"></strong> </a>
						  
						</li>
						<li><a href="${pageContext.request.contextPath }/post6/searchUser" class="dropdown-toggle"> <i class="icon-list"></i><span class="menu-text"> 员工信息维护</span> <strong class="arrow icon-angle-down"></strong> </a>
						  
						</li>
						<li><a href="${pageContext.request.contextPath }/post6/searchTraveller" class="dropdown-toggle"> <i class="icon-list"></i><span class="menu-text">散客资料维护</span> <strong class="arrow icon-angle-down"></strong> </a>
						  
						</li>
					</ul>
</body>
</html>