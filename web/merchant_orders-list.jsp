<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>曙阳の汽车小站-所有订单</title>
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
			<div class="content-wrapper" style="min-height: 2065px;">
				<section class="content-header">
					<h1>
						订单管理 <small>订单列表</small>
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> 后台管理</a></li>
						<li><a href="#">订单管理</a></li>
						<li class="active">全部订单</li>
					</ol>
				</section>
				<section class="content"> <!-- .box-body -->
					<c:set var="list" scope="request" value="${pageInfo.list }"/>
					<c:if test="${empty list }">
					   <div id="no_order_info" style="font-size:30px;color:#CA141D;text-align:center;margin: 50px 0px;">没有订单哦，继续加油</div>
					</c:if>
					<c:if test="${not empty list }">
					<div class="box box-primary">			
						<div class="box-body">
							<div class="table-box">
								<c:set var="id" value="1"/>
									<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
										<thead>
											<tr>
												<th class="" style="padding-right:0px;"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
												<th>编号</th>
												<th>订单号</th>				
												<th>下单时间</th>
												<th>下单用户</th>
												<th>订单金额</th>
												<th>收货地址</th>
												<th>支付状态</th>
												<th>操作</th>
											</tr>
										</thead>
										<c:forEach items="${list}" var="order">
										<tbody>
											<tr>
											 	<td><input name="ids" type="checkbox"></td>
												<td>${id }</td>
												<td>${ order.id }</td>
												<td>${ order.ordertime }</td>
												<td>${ order.user_id }</td>
												<td>${ order.money }</td>
												<td>${ order.receiverinfo }</td>
												<td>
													<c:if test="${ order.paystate==0 }" var="paystate">
														未支付
													</c:if>
													<c:if test="${ order.paystate==1 }" var="paystate">
														已支付
													</c:if>
												</td>
												<td class="text-center">
													<button type="button" class="btn bg-olive btn-xs" style="vertical-align: middle;" onclick="location.href='${pageContext.request.contextPath}/order/findOrderByOrderId?orderId=${order.id}'">查看</button>
													<!-- <button type="button" class="btn bg-olive btn-xs" onclick="location.href=&quot;merchant_orders-edit.jsp&quot;">删除</button> -->
												</td>
												<c:set var="id" value="${id+1 }"/>
											</tr>
										</tbody>
									</c:forEach>	
									</table>
								<div class="pull-left">
									<div class="form-group form-inline">
										<div class="btn-group">
											<button type="button" class="btn btn-default" title="删除" onclick="confirm(&quot;你确认要删除吗？&quot;)">
												<i class="fa fa-trash-o"></i> 删除
											</button>
											<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();">
												<i class="fa fa-refresh"></i> 刷新
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="box-footer">
							<div class="pull-left">
								<div class="form-group form-inline">
									 共<div style="display:inline;">&nbsp;${pageInfo.pages}&nbsp;</div>页 &nbsp; 每页显示
									<select class="form-control" id="changePageSize">
									 	<option value="4" selected="selected">5</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="50">50</option>
										<option value="80">80</option>
									</select> 条订单数据
								</div>
							</div>
							 <div class="box-tools pull-right">
		                        <ul class="pagination">
		                            <li>
		                                <a href="${pageContext.request.contextPath}/order/findOrdersByPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
		                            </li>
		                            <li><a href="${pageContext.request.contextPath}/order/findOrdersByPage?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
		                           
		                           <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
									   <li><a href="${pageContext.request.contextPath}/order/findOrdersByPage?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
								   </c:forEach>
								   
		                            <li><a href="${pageContext.request.contextPath}/order/findOrdersByPage?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
		                            <li>
		                                <a href="${pageContext.request.contextPath}/order/findOrdersByPage?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
		                            </li>
		                        </ul>
		                    </div>
						</div>
					</c:if>
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
				padding-right: 8px!important;
			}
		</style>
		<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	    <script>
	        $.widget.bridge('uibutton', $.ui.button);
	    </script>
	    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
	    <script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<script>
			$("#changePageSize").change(function(){
				var pageSize =  $(this).children('option:selected').val();
				location.href = "${pageContext.request.contextPath}/order/findOrdersByPage?page=1&size="
						+ pageSize;
			});
			  $(document).ready(function() {
	            $(".select2").select2();
	            $(".textarea").wysihtml5({
	                locale: 'zh-CN'
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
	                checkboxClass: 'icheckbox_square-blue',
	                increaseArea: '20%'
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
	            $("#changePageSize").find("option[value='<%=request.getAttribute("psize") %>']").attr("selected","selected");
	        });
		</script>
	</body>
</c:if>
</html>