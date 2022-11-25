<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>订单详情</title>
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
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
				订单管理 <small>全部订单</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="all-admin-index.html"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="all-order-manage-list.html">订单管理</a></li>
				<li class="active">订单详情</li>
			</ol>
			</section>
			<c:forEach items="${list}" var="orderInfo">
			<section class="content"> <!--订单信息-->
			<div class="panel panel-default">
				<div class="box-header with-border">
                       <i class="fa fa-cube"></i>
                       <h3 class="box-title">订单详情</h3>
                   </div>
				<div class="row data-type">

					<div class="col-md-2 title">订单编号</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="订单编号"
							value="${orderInfo.order.id }" readonly="readonly">
					</div>
					
					<div class="col-md-2 title">顾客账户</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="顾客账户"
							value="${order_user }" readonly="readonly">
					</div>
					
					<div class="col-md-2 title">下单时间</div>
					<div class="col-md-4 data">
						<div class="input-group date">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" class="form-control pull-right"
								id="datepicker-a3" readonly="readonly"
								value="${orderInfo.order.ordertime}">
						</div>
					</div>
					
					<div class="col-md-2 title">收货地址</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="收货地址"
							value="${orderInfo.order.receiverinfo }" readonly="readonly">
					</div>

					<div class="col-md-2 title">订单金额</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="订单金额"
							value="${orderInfo.order.money } 元" readonly="readonly">
					</div>
					
					<div class="col-md-2 title">支付状态</div>
					<div class="col-md-4 data">
						<c:if test="${ orderInfo.order.paystate==0 }" var="paystate">
							<input type="text" class="form-control" placeholder="支付状态"
								value="未支付" readonly="readonly" style="color:red">
						</c:if>
						<c:if test="${ orderInfo.order.paystate==1 }" var="paystate">
							<input type="text" class="form-control" placeholder="支付状态"
									value="已支付" readonly="readonly" style="color:green">
						</c:if>
					</div>
				</div>
			</div>
			<div class="box box-primary">
                   <div class="box-header with-border">
                       <i class="fa fa-cube"></i>
                       <h3 class="box-title">商品信息</h3>
                   </div>
                   <div class="box-body">
                       <div class="table-box">
                           <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                               <thead>
                                   <tr>
                                       <th class="text-center">商品图片</th>
                                       <th class="text-center">商品名称</th>
                                       <th class="text-center">现有库存</th>  
                                       <th class="text-center">单价</th>
                                       <th class="text-center">购买数量</th>  
                                       <th class="text-center">小计</th>
                                   </tr>
                               </thead>
                               <tbody>
                               <c:forEach items="${ orderInfo.map }" var="entry">
                                   <tr>
                                       <td align="center" valign="middle" bgcolor="#FFFFFF">
											<img src="${pageContext.request.contextPath}/product/findProductImgByUrl?imgurl=${ entry.key.imgurl }" width="90" height="105">
									   </td>
                                       <td class="text-center" style=" vertical-align: middle;">${ entry.key.name }</td>
                                       <td class="text-center" style=" vertical-align: middle;">${ entry.key.pnum }</td>
                                       <td class="text-center" style=" vertical-align: middle;">${ entry.key.price }元</td>
                                       <td class="text-center" style=" vertical-align: middle;">${ entry.value }件</td>
                                       <td class="text-center" style=" vertical-align: middle;">${ entry.key.price * entry.value }元</td>
                                   </tr>
                                   </c:forEach>
                               </tbody>
                           </table>
                       </div>
                   </div>
               </div>
			<div class="box-tools text-center">
				<button type="button" class="btn bg-default"
					onclick="history.back(-1);">返回</button>
			</div>
		 </section>
		 </c:forEach>
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
			padding-right: 8px!important;
		}
	</style>
	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
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
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script>
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
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
			setSidebarActive("order-manage");
			// 列表按钮 
			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});
			// 全选操作 
			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
			});
		});
	</script>
	</body>
</c:if>
</html>