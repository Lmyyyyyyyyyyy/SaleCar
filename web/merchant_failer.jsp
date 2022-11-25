<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>登录失败</title>
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
</head>	
	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
			<header class="main-header">
				<a href="merchant_index.jsp" class="logo"> 
					<span class="logo-mini"><b>曙阳の汽车小站</b></span>
					<span class="logo-lg"><b>商家</b>后台管理</span>
				</a>
				<nav class="navbar navbar-static-top">
					<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
						role="button"> <span class="sr-only">Toggle navigation</span>
					</a>
					<div class="navbar-custom-menu">
						<ul class="nav navbar-nav">
							<li class="dropdown user user-menu"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown"> <img
									src="${pageContext.request.contextPath}/img/user/user2-160x160.jpg"
									class="user-image" alt="User Image"> <span class="hidden-xs">
										未登录
								</span>
							</a>
								<ul class="dropdown-menu">
									<!-- User image -->
									<li class="user-header"><img
										src="${pageContext.request.contextPath}/img/user/user2-160x160.jpg"
										class="img-circle" alt="User Image"></li>				
								</ul>
							</li>
						</ul>
					</div>
				</nav>
		</header>
		<aside class="main-sidebar">
			<section class="sidebar">
				<div class="user-panel">
					<div class="pull-left image">
						<img src="${pageContext.request.contextPath}/img/user/user2-160x160.jpg"
							class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>
							未登录
						</p>
						<a href="#"><i class="fa fa-circle text-failer" style="color:red"></i>离开</a>
					</div>
				</div>
				<ul class="sidebar-menu">
					
					<li id="admin-index"><a href="${pageContext.request.contextPath}/merchant/initAllData">
						<i class="fa fa-dashboard"></i> <span>首页</span></a>
					</li>
					<%-------------商品管理（开始）----------------%>
					<li class="treeview">
						<a href="#">
							<i class="fa fa-cogs"></i>
							<span>商品</span>
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li id="system-setting">
								<a href="${pageContext.request.contextPath}/product/findAllProductsByPage">
									<i class="fa fa-circle-o"></i> 商品列表
								</a>
							</li>
							<li id="system-setting">
								<a href="${pageContext.request.contextPath}/merchant_products-add.jsp">
									<i class="fa fa-circle-o"></i> 添加商品
								</a>
							</li>
						</ul>
					</li>
			        <%-------------订单管理（开始）----------------%>
					<li class="treeview">
						<a href="#">
							<i class="fa fa-cogs"></i>
							<span>订单</span>
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li id="system-setting">
								<a href="${pageContext.request.contextPath}/order/findOrdersByPage">
									<i class="fa fa-circle-o"></i> 订单列表
								</a>
							</li>
						</ul>
					</li>
					
					<%-------------日志查询（开始）----------------%>
					<li class="treeview">
						<a href="#">
							<i class="fa fa-cogs"></i>
							<span>日志</span>
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li id="system-setting">
								<a href="${pageContext.request.contextPath}/log/findAllSysLog">
									<i class="fa fa-circle-o"></i> 日志查询
								</a>
							</li>
						</ul>
					</li>
					
				</ul>
			</section>
		</aside>
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<h1>登录失败</h1>
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/merchant_index.jsp"><i
								class="fa fa-dashboard"></i> 首页</a></li>
						<li class="active">登录失败</li>
					</ol>
				</section>
				<section class="content">
					<div class="error-page">
						<div class="error-content">
							<p>
								还未登录，您可以 <a href="${pageContext.request.contextPath}/merchant_login.jsp">返回到登录页面</a>
								重新登录
							</p>
						</div>
					</div>
				</section>
			</div>
			<footer class="main-footer">
				<div class="pull-right hidden-xs">
					<b>Version</b> 1.0.6
				</div>
			</footer>
		</div>
		<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
		<script>
			$.widget.bridge('uibutton', $.ui.button);
		</script>
		<script
			src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
		<script>
			$(document).ready(function() {
				$(".select2").select2();
				$(".textarea").wysihtml5({
					locale : 'zh-CN'
				});
			});
			// 设置激活菜单
			function setSidebarActive(tagUri) {
				var liObj = $("#" + tagUri);
				if (liObj.length > 0) {
					liObj.parent().parent().addClass("active");
					liObj.addClass("active");
				}
			}
			$(document).ready(function() {
				// 激活导航位置
				setSidebarActive("admin-index");
			});
		</script>
	</body>
</html>