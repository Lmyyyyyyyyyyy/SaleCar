<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>曙阳の汽车小站-商家后台</title>
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

	<c:if test="${sessionScope.merchant==null }">
		<jsp:forward page="merchant_failer.jsp"/>
	</c:if>	
	<c:if test="${sessionScope.merchant!=null }">
		<% 
			if(session.getAttribute("user")!=null)
				session.removeAttribute("user");
		%>
	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
			<jsp:include page="merchant_header.jsp" />
			<jsp:include page="merchant_aside.jsp" />
			<div class="content-wrapper">
				<section class="content-header">
	                <h1>
	                    <small>首页</small>
	                </h1>
	                <ol class="breadcrumb">
	                    <li><a href="merchant_index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
	                </ol>
	            </section>
	            <section class="content">
					<div class="row">
	                    <div class="col-lg-3 col-xs-6">
	                        <div class="small-box bg-aqua">
	                            <div class="inner">
	                          		<h3>${ today_num}</h3>		                        
	                                <p>今日订单数</p>
	                            </div>
	                            <div class="icon">
	                                <i class="ion ion-bag"></i>
	                            </div>
	                            <a href="#" class="small-box-footer"> <i class="fa fa-arrow-circle-right"></i></a>
	                        </div>
	                    </div>
	                    <div class="col-lg-3 col-xs-6">
	                        <div class="small-box bg-green">
	                            <div class="inner">
	                              	<c:if test="${ today_money==null }" var="today_num">
		                            	 <h3>0</h3>
		                            </c:if>
	                               	<c:if test="${ today_money!=null }" var="today_num">
		                            	 <h3>${ today_money}</h3>
		                            </c:if>
	                                <p>今日销售额</p>
	                            </div>
	                            <div class="icon">
	                                <i class="ion ion-stats-bars"></i>
	                            </div>	
	                            <a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
	                        </div>
	                    </div>
	                    <div class="col-lg-3 col-xs-6">
	                        <div class="small-box bg-yellow">
	                            <div class="inner">
	                            	<c:if test="${ yestoday_money==null }" var="today_num">
		                            	 <h3>0</h3>
		                            </c:if>
	                               	<c:if test="${ yestoday_money!=null }" var="today_num">
		                            	 <h3>${ yestoday_money}</h3>
		                            </c:if>
	                                <p>昨日销售额</p>
	                            </div>
	                            <div class="icon">
	                                <i class="ion ion-person-add"></i>
	                            </div>
	                       		<a href="#" class="small-box-footer"><i class="fa fa-arrow-circle-right"></i></a>
	                        </div>
	                    </div>
	                    <div class="col-lg-3 col-xs-6">
	                        <div class="small-box bg-red">
	                            <div class="inner">
	                            	<c:if test="${ all_products_num==null }" var="today_num">
		                            	 <h3>0</h3>
		                            </c:if>
	                               	<c:if test="${ all_products_num!=null }" var="today_num">
		                            	 <h3>${ all_products_num}</h3>
		                            </c:if>
	                                <p>已上架商品</p>
	                            </div>
	                            <div class="icon">
	                                <i class="ion ion-pie-graph"></i>
	                            </div>
	                            <a href="${pageContext.request.contextPath}/product/findAllProductsByPage" class="small-box-footer">详细 <i class="fa fa-arrow-circle-right"></i></a>
	                        </div>
	                    </div>      
	                </div>  
	                <div class="box box-primary">
	                    <div class="box-header with-border">
	                        <i class="fa fa-cube"></i>
	                        <h3 class="box-title">待处理订单</h3>
	                    </div>
	                    <div class="box-body">
								<div class="table-box">
									<c:set var="id" value="1"/>
										<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
											<thead>
												<tr>
													<th>编号</th>
													<th>订单号</th>				
													<th>下单时间</th>
													<th>订单金额</th>
													<th>收货地址</th>
													<th>支付状态</th>
												</tr>
											</thead>
											<c:forEach items="${list}" var="order">
											<tbody>
												<tr>
													<td>${id }</td>
													<td>${ order.id }</td>
													<td>${ order.ordertime }</td>
													<td>${ order.money }</td>
													<td>${ order.receiverinfo }</td>
													<td>
														<c:if test="${ order.paystate==0 }" var="paystate">
															未支付
														</c:if>
				
													</td>
													<c:set var="id" value="${id+1 }"/>
												</tr>
											</tbody>
										</c:forEach>	
										</table>
									<div class="pull-left">
										<div class="form-group form-inline">
											<div class="btn-group">
											
												<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();">
													<i class="fa fa-refresh"></i> 刷新
												</button>
											</div>
										</div>
									</div>
								</div>
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
		<style type="text/css">
			th,td{
				text-align: center!important;
				vertical-align: middle!important;
			}
			th{
				padding-right: 8px;
			}
		</style>
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
</c:if>
</html>