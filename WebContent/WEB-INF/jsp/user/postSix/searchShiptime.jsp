<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/layui.css" />
		<script src="${pageContext.request.contextPath }/assets/js/ace-extra.min.js"></script>
<!--页面文件-->


<title>Insert title here</title>
<link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            /* css 代码  */
        </style>
        <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/oldie.js"></script>
        <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
</head>
<body>
<%@include file="../../header.jsp" %>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>

							<button class="btn btn-info"><em class="icon-pencil"></em></button>

							<button class="btn btn-warning"><em class="icon-group"></em></button>

							<button class="btn btn-danger"><em class="icon-cogs"></em></button>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div><!-- #sidebar-shortcuts -->

<!-- 导航栏 -->
						<%@include file="postSix.jsp" %>


					<!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>

				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<!--   首页跳转     到该用户的首页-->
								<a href="#">首页</a>
							</li>
						</ul>
						<!-- .breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
								<!--	<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />  -->
									
								</span>
							</form>
						</div><!-- #nav-search -->
					</div>

					<div class="page-content">
						<%@include file="../../page_header.jsp" %><!-- /.page-header -->

						<div class="row"> <!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! /.col -->
						
						<form action="${pageContext.request.contextPath }/post6/searchShiptime">  
		<select name="shipState">
				<option value="0">船次</option>
				<option value="1">船舷</option>
		</select>
		<input type="text" name="shipNo" placeholder="请输入船次号／船舷号" />

<!-- &nbsp&nbsp&nbsp --><input style="width:100px"  type="submit"  class="btn btn-xs btn-danger"/><br/><br/>
</form> 
<a href="${pageContext.request.contextPath }/post6/jumpAddShiptime">
		<button type="submit" class="btn btn-xs btn-danger">新增船次</button>
	</a>
						<div class="col-xs-12">
						
						
						
						
						
																<div class="table-responsive">
											<table id="sample-table-1" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
				<th width="20">船次</th>
				<th>票价</th>
				<th>船舷号</th>
				<th>出发时间</th>
				<th>出发港口</th>
				<th>到达时间</th>
				<th>到达港口</th>
				<th>售票时间</th>
				<th>状态</th>
				<th>操作</th>

														
														
													</tr>
												</thead>

												<tbody>
												<c:forEach items="${list}" var="list" varStatus="loop">
				<tr>
				    <td width="20">${list.shiptimeNo }</td>
					<td>${list.price}</td>
					<td>${list.shipNo }</td>
					<td>${startList[loop.count-1] }</td>
					<td>${list.startPort}</td>
					<td>${arrList[loop.count-1] }</td>
					<td>${list.arrPort}</td>
					<td>${sellList[loop.count-1] }</td>
					<td>${list.dShiptimestate}</td>
					<td>
						<form style="display: inline-block;"
							action="${pageContext.request.contextPath }/post6/jumpChangeShiptime">
							<input type="hidden" name="shiptimeNo" value="${list.shiptimeNo}"> <input
								type="submit" value="修改"  class="layui-btn" >
						</form>
						<form style="display: inline-block;"
							action="${pageContext.request.contextPath }/post6/deleteShiptime">
							<input type="hidden" name="shiptimeNo" value="${list.shiptimeNo}"> <input
								type="submit" value="删除"  class="layui-btn" >
						</form>
						<form style="display: inline-block;"
							action="${pageContext.request.contextPath }/post6/showShiptime">
							<input type="hidden" name="shiptimeNo" value="${list.shiptimeNo}"> <input
								type="submit" value="查询"  class="layui-btn" >
						</form>
					</td>


				</tr>
			</c:forEach>
			</tbody>
		</table></div>
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						</div>
	
<div id="container" style="min-width:400px;height:400px"></div>
        
						
						
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-skin="default" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; 选择皮肤</span>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
							<label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
						</div>
						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl">切换到左边</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
							<label class="lbl" for="ace-settings-add-container">
								切换窄屏
								<b></b>
							</label>
						</div>
					</div>
				</div><!-- /#ace-settings-container -->
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
<%@include file="../../footer.jsp" %>
</body>
</html>