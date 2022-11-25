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
		<title>添加商品</title>	
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
				商品管理 <small>添加新商品</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="all-admin-index.html"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="all-order-manage-list.html">商品管理</a></li>
				<li class="active">添加商品</li>
			</ol>
			</section>
			<section class="content"> <!--订单信息-->
			<form action="${ pageContext.request.contextPath}/product/addProduct" id="addForm" method="post" enctype="multipart/form-data" onsubmit="return confirm();">
			<div class="panel panel-default">
				<div class="box-header with-border">
                       <i class="fa fa-cube"></i>
                       <h3 class="box-title">新商品信息</h3>
                </div>
                <div class="row data-type">
					<div class="col-md-3 img_div">
				        <div class="file-loading" style="height: 15vw;width: 20vw;text-align: center; 	vertical-align: middle;">
				            <input id="upload-input" name="pictureFile" type="file" accept="image/gif,image/jpeg,image/png" onchange="show(this)" style="display:none" multiple>
			        		<img id="select_img" src=""  onerror="imgerrorfun(this)" /> 
				        </div>
					</div> 
					<div class="col-md-2 title" style="margin-top:3.5px">商品名称</div>
					<div class="col-md-6 data" style="margin-top: 3.5px">
						<input type="text" id="name" class="form-control" placeholder="商品名称"
							 name="name">
					</div>
					<div class="col-md-2 title" style="margin-top: 3.5px">商品类别</div>
					<div class="col-md-6 data" style="margin-top: 3.5px">
						<input type="text" id="category" class="form-control" placeholder="商品类别"
							 name="category">
					</div>
					<div class="col-md-2 title" style="margin-top: 3.5px">商品价格</div>
					<div class="col-md-6 data" style="margin-top: 3.5px">
						<input type="number" id="price" class="form-control" placeholder="商品价格"
							  name="price">
					</div>
					<div class="col-md-2 title" style="margin-top: 3.5px">商品库存</div>
					<div class="col-md-6 data"  style="margin-top: 3.5px">
						<input type="number" id="pnum" class="form-control" placeholder="商品库存"
							 name="pnum">
					</div>
					<div class="col-md-2 title" style="margin-top: 3.5px">商品描述</div>
					<div class="col-md-6 data" style="margin-top: 3.5px">
						<input type="text" id="description" class="form-control" placeholder="商品描述"
							 name="description">
					</div>
				</div>
			</div>
			<div class="box-tools text-center">
				<input type="submit" class="btn bg-maroon" value="上架"/>
				<button type="button" class="btn bg-default"
					onclick="history.back(-1);">返回</button>
			</div>
			</form>
		 </section>
		</div>
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.6
			</div>
		</footer>
	</div>
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
	<style type="text/css">
		.file-loading{
			width: auto;
			height: 200px;
			display: table-cell;
			vertical-align: middle;
			text-align: center;
			border: 1px solid #ccc;
			maring-top: 20px;
		}
	</style>
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
		function imgerrorfun(img){
			
			var img = document.getElementById('select_img'); 
			img.style.width='3vw';
			img.style.height='2.8vw';
			img.src = "${pageContext.request.contextPath}/img/icon/upload_icon.png";
		}
	  	function show(file){	
			var reader = new FileReader();	
			var img = document.getElementById('select_img'); 
			reader.onload = function(evt){
				img.style.width='13vw';
				img.style.height='15vw';	
				img.src = evt.target.result;
			}
		    reader.readAsDataURL(file.files[0]);
		}
		function confirm(){
           	var name=$("#name").val();
           	var category=$("#category").val();
           	var price=$("#price").val();
           	var pnum=$("#pnum").val();;
           	var description=$("#description").val();
          	var fileInput=$('#upload-input').get(0).files[0];	
      		if(name==""||category==""||price<=0||price==""||pnum<0||pnum==""||description==""){
      			alert("信息填写不正确或不完整");
      			return false;
    		}
    		if(!fileInput){
    			alert("请上传商品图片");
   				return false;
   			}
      		return true;
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
			
			$("#select_img").click(function(){
				$("#upload-input").click();
			});
		
		});
		</script>
	</body>
</c:if>

</html>