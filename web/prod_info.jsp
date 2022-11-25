<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/css/prodInfo.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/head.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/foot.css" rel="stylesheet" type="text/css">
</head>
<!-- 引入jQuery函数库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.4.2.js"></script>
<script type="text/javascript">
		$(function(){
			$("#delNum").click(function() {
				var $buyNumInp = $(this).siblings("input")
				var buyNum = $buyNumInp.val();
				var newBuyNum = buyNum;
				if (buyNum > 1) {
					newBuyNum = buyNum - 1;
					$buyNumInp.val(newBuyNum);
				}
				var pid = $buyNumInp.attr("id");
			});
			
			$("#addNum").click(function() {
				
				var $buyNumInp = $(this).siblings("input")
				var buyNum = $buyNumInp.val();
				var newBuyNum = parseInt(buyNum) + 1;
				$buyNumInp.val(newBuyNum);
				var pid = $buyNumInp.attr("id");
				
			});
		});
	</script>
<body>

	<div id="warp">
		<div id="left">
			<div id="left_top">
				<img src="${pageContext.request.contextPath}/product/findProductImgByUrl?imgurl=${prod.imgurl}"/>
			</div>
			<div id="left_bottom">
				<img id="lf_img" src="${pageContext.request.contextPath}/img/prodInfo/lf.jpg"/>
				<img id="mid_img" src="${pageContext.request.contextPath}/product/findProductImgByUrl?imgurl=${prod.imgurl}" width="60px" height="60px"/>
				<img id="rt_img" src="${pageContext.request.contextPath}/img/prodInfo/rt.jpg"/>
			</div>
		</div>
	<form action="${pageContext.request.contextPath}/cart/addProductToCart" method="post">
		<div id="right">
			<div id="right_top">
				<span id="prod_name">${prod.name }<br/>
				<br>
				<span id="prod_desc">${prod.description }<br/>
			</div>
			<div id="right_middle">
				<span id="right_middle_span">
					商品 价格：
				<span class="price_red">￥${prod.price }
				<br/>
			    运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费：满 100 免运费<br />
			    服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务 空运直达，并提供售后服务<br />
			    购买数量：
	            <a href="javascript:void(0)" id="delNum" >-</a>
	            <input type="text" id="buyNumInp" name="buyNum" value="1" id="${prod.id }">
		        <a href="javascript:void(0)" id="addNum">+</a>
			</div>
			<div id="right_bottom">
				<input type="hidden" name="pid" value="${prod.id }"/>
				<input class="add_cart_but" type="submit" value=""/>	
			</div>
	</form>
		</div>
	</div>

</body>
</html>