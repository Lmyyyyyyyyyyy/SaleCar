<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<!-- 页面meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>曙阳の汽车小站-所有商品</title>

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
	<body class="hold-transition skin-blue sidebar-mini">
	
		<div class="wrapper">
			<!-- 页面头部 -->
			<jsp:include page="merchant_header.jsp" />
			<!-- 页面头部 /-->
			
			<!-- 导航侧栏 -->
			<jsp:include page="merchant_aside.jsp" />
			<div class="content-wrapper" style="min-height: 2065px;">
				<section class="content-header">
					<h1>
						商品管理 <small>商品列表</small>
					</h1>
					<ol class="breadcrumb">
						<li><a href="#"><i class="fa fa-dashboard"></i> 后台管理</a></li>
						<li><a href="#">商品管理</a></li>
						<li class="active">商品列表</li>
					</ol>
				</section>
				<section class="content"> <!-- .box-body -->
					<c:set var="list" scope="request" value="${pageInfo.list }"/>
					<c:set var="map" scope="request" value="${map }"/>
					<c:if test="${empty list }">
					   <div id="no_order_info" style="font-size:30px;color:#CA141D;text-align:center;margin: 50px 0px;">没有商品呢</div>
					</c:if>
					<c:if test="${not empty list }">
					<div class="box box-primary">			
						<div class="box-body">
							<!-- 数据表格 -->
							<div class="table-box">
								<!--工具栏/-->
								<c:set var="id" value="1"/>			
								<!--数据列表-->
									<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
										<thead>
											<tr>
												<th class="" style="padding-right:0px;"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
												<th>编号</th>
												<th>商品Id</th>		
												<th>商品图片</th>	
												<th>商品名称</th>
												<th>价格</th>
												<th>库存</th>
												<th>销量</th>
												<th>审核状态</th>
												<th>操作</th>
											</tr>
										</thead>
										<c:forEach items="${list}" var="product">
										<tbody>
											<tr>
											 	<td><input name="ids" type="checkbox" value="${product.id }" ></td>
												<td>${ id }</td>
												<td id="p_id">${ product.id }</td>
											    <td id="p_img" align="center" valign="middle" bgcolor="#FFFFFF">
													<img src="${pageContext.request.contextPath}/product/findProductImgByUrl?imgurl=${ product.imgurl }" width="90" height="105">
											    </td>
											    <td id="p_name">${ product.name }</td>
												<td id="p_price">${ product.price }</td>
												<td id="p_pnum">${ product.pnum }</td>
												<c:if test="${not empty map[product.id] }">
													<td id="p_buynum">${map[product.id] }</td>
												</c:if>
												<c:if test="${empty map[product.id] }">
													<td id="p_buynum">0</td>
												</c:if>
												<td id="p_state">
													未审核
												</td>
												<td class="text-center">
													<button type="button" class="btn bg-olive btn-xs show_product">查看</button>
													<button type="button" class="btn bg-olive btn-xs edit_product">编辑</button>
												</td>
												<c:set var="id" value="${id+1 }"/>
											</tr>
										</tbody>
									</c:forEach>	
									</table>
								<!--数据列表/-->
								<!--工具栏-->
								<div class="pull-left">
									<div class="form-group form-inline">
										<div class="btn-group">
											<button type="button" class="btn btn-default delete_product" title="下架">
												<i class="fa fa-trash-o"></i> 下架
											</button>
											<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();">
												<i class="fa fa-refresh"></i> 刷新
											</button>
										</div>
									</div>
								</div>
								<!--工具栏/-->
							</div>
							<!-- 数据表格 /-->
						</div>
						<!-- /.box-body -->
						<!-- .box-footer-->
						<div class="box-footer">
							<div class="pull-left">
								<div class="form-group form-inline">
									 共<div style="display:inline;">&nbsp;${pageInfo.pages}&nbsp;</div>页 &nbsp; 每页显示
									<select class="form-control" id="changePageSize">
									 	<option value="20" selected="selected">20</option>
										<option value="30">30</option>
										<option value="40">40</option>
										<option value="60">60</option>
										<option value="80">80</option>
									</select> 条订单数据
								</div>
							</div>
							 <div class="box-tools pull-right">
		                        <ul class="pagination">
		                            <li>
		                                <a href="${pageContext.request.contextPath}/product/findAllProductsByPage?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
		                            </li>
		                            <li><a href="${pageContext.request.contextPath}/product/findAllProductsByPage?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
		                           
		                           <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
									   <li><a href="${pageContext.request.contextPath}/product/findAllProductsByPage?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
								   </c:forEach>
								   
		                            <li><a href="${pageContext.request.contextPath}/product/findAllProductsByPage?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
		                            <li>
		                                <a href="${pageContext.request.contextPath}/product/findAllProductsByPage?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
		                            </li>
		                        </ul>
		                    </div>
						<!-- /.box-footer-->
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
		
		<!--查看弹窗 -->
		<div class="modal fade" id="show_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						商品详情
					</h4>
				</div>
				<div class="modal-body show-modal-body">
					<style type="text/css">
						h4,p{
							display: inline-block;
						}
					</style>
					<div class="row">
						<div class="col-md-4" id="product_img">
						</div>
						<div class="col-md-8 text-center" >
							<h4>商品ID:</h4>
							<p id="product_id"></p>
						</div>
						<div class="col-md-8 text-center" >
							<h4>商品名:</h4>
							<p id="product_name"></p>
						</div>
						<div class="col-md-8 text-center" >
							<h4>价格:</h4>
							<p id="product_price"></p>
						</div>
						<div class="col-md-8 text-center" >
							<h4>销量:</h4>
							<p id="product_buynum"></p>
						</div>
						<div class="col-md-8 text-center" >
							<h4>库存:</h4>
							<p id="product_pnum"></p>
						</div>
						<div class="col-md-8 text-center" >
							<h4>审核状态:</h4>
							<p id="product_state"></p>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal" >确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 编辑弹窗 -->
	<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						商品编辑
					</h4>
				</div>
			<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/product/updateProduct">
				<div class="modal-body edit-modal-body">
					<style type="text/css">
						h4,p{
							display: inline-block;
						}
					</style>
					<div class="row">
						<div class="form-group" style="display: none">
							<label class="col-sm-2 control-label">ID</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="id" id="pro_id" 
									   placeholder="修改商品ID">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">图片</label>
							<div class="col-sm-10" id="pro_img">
								
							</div>
						</div>
						
						<div class="form-group">
							<label for="名称" class="col-sm-2 control-label">名称</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="name" id="pro_name" 
									   placeholder="修改名称">
							</div>
						</div>
						<div class="form-group">
							<label for="价格" class="col-sm-2 control-label">价格</label>
							<div class="col-sm-8">
								<input type="number" class="form-control" name="price" id="pro_price" 
									   placeholder="修改价格">
							</div>	
						</div>
						<div class="form-group">
							<label for="库存" class="col-sm-2 control-label">库存</label>
							<div class="col-sm-8">
								<input type="number" class="form-control" name="pnum" id="pro_pnum" 
									   placeholder="修改库存">
							</div>
						</div>
					</div>
				</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<input type="submit" class="btn btn-primary" style="background: red" id="save" value="保存"/>
					</div>
				</form>
			</div>
		</div>
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
		<style type="text/css">
			.show-modal-body #product_img img{
				width: 125%;
				height: 17vw;
			}
		</style>
		<script>
		    	
			$("#changePageSize").change(function(){
				var pageSize =  $(this).children('option:selected').val();
				//向服务器发送请求，改变没页显示条数
				location.href = "${pageContext.request.contextPath}/product/findAllProductsByPage?page=1&size="
						+ pageSize;
			});
			  $(document).ready(function() {
	            // 选择框
	            $(".select2").select2();
	            // WYSIHTML5编辑器
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
				
				$('.delete_product').on('click', function(){
					
		      		var obj = document.getElementsByName("ids");
		      		
			        var delete_arr = [];
			        for (var i = 0; i < obj.length; i++) {
			            if (obj[i].checked)
			            	delete_arr.push(obj[i].value)
			        }
			        if(confirm("确定要下架所有选择的"+(delete_arr.length)+"件商品吗")==true){
			        	
	                	location.href = "${pageContext.request.contextPath}/product/deleteProductsByProductId?ids="+delete_arr;		       			          
	     			}
			        if(delete_arr.length==0){
			        	alert("请选择要下架的商品（该商品未有订单）"); 
			        	return; 
			        }
		    	});
		    	
				var product_id="";
				var product_img="";
				var product_name="";
				var product_price=0;
				var product_buynum=0;
				var product_pnum=0;
				var product_state="未审核";	
								
		   	  	$('.show_product').on('click', function(){
		      		product_id=$(this).parent().parent().children("#p_id").text();
		      		product_img=$(this).parent().parent().children("#p_img").html();
		      		product_name=$(this).parent().parent().children("#p_name").text();
	      			product_price=$(this).parent().parent().children("#p_price").text();
    				product_buynum=$(this).parent().parent().children("#p_buynum").text();
  					product_pnum=$(this).parent().parent().children("#p_pnum").text();
  					product_state=$(this).parent().parent().children("#p_state").text();
	      			$('#show_modal').modal('show');		
		    	});
		    	
		    	$('#show_modal').on('show.bs.modal', function (event) {	
		      		var modal = $(this);  //get modal itself
		      		modal.find('.show-modal-body #product_id').text(product_id);
		      		modal.find('.show-modal-body #product_img').html(product_img);
		      		modal.find('.show-modal-body #product_name').text(product_name);
		      		modal.find('.show-modal-body #product_price').text(product_price);
		      		modal.find('.show-modal-body #product_buynum').text(product_buynum);
		      		modal.find('.show-modal-body #product_pnum').text(product_pnum);
		      		modal.find('.show-modal-body #product_state').text(product_state);
		    	});
		    	//清除上一次的数据
	       		$("#show_modal").on("hidden.bs.modal", function() {
				    $(this).removeData("bs.modal");
				});
					
								
		   	  	$('.edit_product').on('click', function(){
	
		      		product_id=$(this).parent().parent().children("#p_id").text();
		      		product_img=$(this).parent().parent().children("#p_img").html();
		      		product_name=$(this).parent().parent().children("#p_name").text();
	      			product_price=$(this).parent().parent().children("#p_price").text();
    				product_buynum=$(this).parent().parent().children("#p_buynum").text();
  					product_pnum=$(this).parent().parent().children("#p_pnum").text();
	      			$('#edit_modal').modal('show');		
		    	});
		    	
		    	$('#edit_modal').on('show.bs.modal', function (event) {	
		      		var modal = $(this);  
		      		modal.find('.edit-modal-body #pro_id').val(product_id);
		      		modal.find('.edit-modal-body #pro_img').html(product_img);
		      		modal.find('.edit-modal-body #pro_name').val(product_name);
		      		modal.find('.edit-modal-body #pro_price').val(product_price);
		      		modal.find('.edit-modal-body #pro_pnum').val(product_pnum);
		    	});
		    	//清除上一次的数据
	       		$("#edit_modal").on("hidden.bs.modal", function() {
				    $(this).removeData("bs.modal");
				});
				
	        });
		</script>
	</body>
</c:if>
</html>