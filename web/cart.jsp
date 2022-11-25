<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>曙阳汽车销售</title>
	<link rel="stylesheet" href="<${pageContext.request.contextPath}/css/index1.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //Custom Theme files -->
	<link href="${pageContext.request.contextPath}/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
	<link href="${pageContext.request.contextPath}/css/style1.css" type="text/css" rel="stylesheet" media="all">
	<!-- js -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-3.1.1.min.js"></script>
	<!-- //js -->
	<!-- cart -->
	<script src="${pageContext.request.contextPath}js/simpleCart.min.js"> </script>
<link href="${pageContext.request.contextPath}/css/cart.css"
	rel="stylesheet" type="text/css">
</head>
<!-- 引入jQuery函数库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.4.2.js"></script>
<script type="text/javascript">
		/* 文档就绪函数 */
		$(function(){
			$(".delNum").click(function() {
			//>>获取输入框
			var $buyNumInp = $(this).siblings("input")//input输入框
			var buyNum = $buyNumInp.val();
			var newBuyNum = buyNum;
			if (buyNum > 1) {//购买数量必须要大于等于1
				newBuyNum = buyNum - 1;
				$buyNumInp.val(newBuyNum);
			}
			//2.利用ajax将session中cartmap中的对应商品的购买数量减1
			//>>获取商品的id和购买数量(newBuyNum)
			var pid = $buyNumInp.attr("id");
			//>>发送ajax请求
			$.post("${pageContext.request.contextPath}/cart/updateBuyNumToCart", {
				"pid" : pid,
				"buyNum" : newBuyNum
			});
			
			//3.重新计算总金额(包括当前商品的总价和所有商品总价的和)
			totalMoney(this, newBuyNum);
		});
		
		/* 重新计算总金额 */
		//修改每种商品sum，修改总和价格
		function totalMoney(thisobj, newBuyNum) {
			//1.获取当前商品的单价
			var price = $(thisobj).parents("ul").find(".li_price").text();
			//2.计算当前商品的总价
			var prod_sum = price * newBuyNum;
			$(thisobj).parents("ul").find(".sum_price").text(prod_sum);
			//4.计算购物车所有商品的总价
			var totalMoney = 0;
			$(".sum_price").each(function() {
				totalMoney += parseFloat($(this).text());
			});
			//设置所有商品的总价
			$("#span_2").text(totalMoney);
		}
		/* 为"加号"绑定点击事件, 点击"加号"将购买数量输入框中的值加1
		 * 同时利用ajax将session中cartmap中的对应商品的数量加1
		 * 重新计算总金额(包括当前商品的总价和所有商品总价的和)
		 */
		$(".addNum").click(function() {
	
			//1.点击"加号"将购买数量输入框中的值加1
			//>>获取输入框
			var $buyNumInp = $(this).siblings("input")//input输入框
			var buyNum = $buyNumInp.val();
			var newBuyNum = parseInt(buyNum) + 1;
			$buyNumInp.val(newBuyNum);

			//2.利用ajax将session中cartmap中的对应商品的购买数量减1
			//>>获取商品的id和购买数量(newBuyNum)
			var pid = $buyNumInp.attr("id");
			
			//>>发送ajax请求
			$.post("${pageContext.request.contextPath}/cart/updateBuyNumToCart", {
				"pid" : pid,
				"buyNum" : newBuyNum
			});
			
			//3.重新计算总金额(包括当前商品的总价和所有商品总价的和)
			totalMoney(this, newBuyNum);
		});
		/* 删除当前商品 
		* 给每一个商品后面的删除按钮添加点击事件, 
		* 点击"删除"删除当前商品(通过也要删除购物车中的商品)
			*/
		$(".delProd").click(function(){
			//1.获取商品的id
			var pid = $(this).attr("id");
					
			//2.利用ajax请求删除购物车中指定id的商品(-1后台会删除该商品)
			$.post("${pageContext.request.contextPath}/cart/addProductToCart",{"pid":pid, "buyNum":-1});			
			
			//3.删除当前页面中的商品
			$(this).parents("ul").remove();
			window.location.reload(); 
			//4.重新计算购物车中商品的总价
			var totalMoney = 0;
			$(".sum_price").each(function(){
				totalMoney += parseFloat($(this).text());
			});				
			//设置所有商品的总价
			$("#span_2").text(totalMoney);
			});
		});	
		
		
	</script>

<body>
<div class="shell-main">
	<div class="shell-main-nav">
	<div class="logo">
		<span>汽车销售中心</span>
	</div>
	<ul>
		<li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
		<li><a href="${pageContext.request.contextPath}/product/showAllProducts">汽车产品</a></li>
		<c:if test="${sessionScope.user!=null }">
			欢迎${sessionScope.user.username }回来!|
			<a href="${pageContext.request.contextPath}/exit.jsp">退出</a>
			<%
				if(session.getAttribute("merchant")!=null)
					session.removeAttribute("merchant");
			%>
		</c:if>
		<c:if test="${sessionScope.user ==null }">
			<li><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			<li><a href="${pageContext.request.contextPath}/register.jsp">注册</a></li>
		</c:if>
		<li><a id="goto_order" href="${pageContext.request.contextPath}/order/findOrderListByUserId">我的订单</a></li>
		<li><a id="goto_cart" href="${pageContext.request.contextPath}/cart.jsp">我的购物车</a></li>
		<div class="nav-box"></div>
	</ul>
	</div>
	<c:set var="user" scope="session" value="${user }"/>
	<c:if test="${user==null }">
		<div>
		   <a href="${pageContext.request.contextPath}/login.jsp"><span style="display: block;color: #36C; font-size: 16px; text-align: center;margin:50px 50px">请先登录</span></a>
		</div>
	</c:if>
	<c:if test="${user!=null }">
		<c:set var="cartmap" scope="session" value="${cartmap }" />
		<c:if test="${empty cartmap }">
			<div id="no_cart_info">
				您的购物车还是空的，赶紧行动吧！您可以： <br>
				<div>
					看看<a
						href="${pageContext.request.contextPath}/product/showAllProducts"><span
						style="color: #36C; font-size: 16px">商城</span></a><br> 前往<a
						href="${pageContext.request.contextPath}/index.jsp"><span
						style="color: #36C; font-size: 16px">首页</span></a>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty cartmap }">
		<div id="wrap">
			<!-- 标题信息 -->
			<ul id="title">
				<li><input class="allC" name="allC" type="checkbox" /> <span
					id="title_checkall_text">全选</span></li>
				<li class="li_prod">商品</li>
				<li>单价（元）</li>
				<li>数量</li>
				<li>小计（元）</li>
				<li>操作</li>
			</ul>
	
			<!-- 购物信息 -->
			<c:set var="totalMoney" value="0" />
			<c:forEach items="${cartmap }" var="entry">
					<ul class="prods">
						<li><input type="checkbox" class="prodC" /></li>
						<li class="li_prod"><img
							src="${pageContext.request.contextPath}/product/findProductImgByUrl?imgurl=${entry.key.imgurl}"
							width="90" height="90" class="prodimg" /> <span class="prodname">${entry.key.name }</span>
						</li>
						<li class="li_price">${entry.key.price }</li>
						<li><a href="javascript:void(0)" class="delNum">-</a> <input
							class="buyNumInp" type="text" readonly="readonly"
							value="${entry.value }" id="${entry.key.id }" /> <a
							href="javascript:void(0)" class="addNum">+</a></li>
						<li class="sum_price">${ entry.key.price*entry.value }</li>
						<li><a id="${entry.key.id }" class="delProd" href="javascript:void(0)">删除</a></li>
					</ul>
					<!-- 累计每一个商品的总价, 结果就是购车中所有的商品的总价 -->
				<c:set var="totalMoney"
					value="${ totalMoney+entry.key.price*entry.value }"></c:set>
			</c:forEach>
			<!-- 总计条 -->
			<div id="total">
				<div id="total_1">
					<input type="checkbox" class="allC" name="allC" /> <span>全选</span> <a
						id="del_a" href="javascript:void(0)">删除选中的商品</a>
					<div id="div_sum">
						<span id="span_1">总价：</span> <span>￥</span> <span id="span_2"
							class="total_sum_price">${ totalMoney }</span>&nbsp;&nbsp;&nbsp;
					</div>
				</div>
				<div id="total_2">
					<a id="goto_order"
					   href="${pageContext.request.contextPath}/order_add.jsp">去结算</a>
				</div>
			</div>
		</div>
		</c:if>
	</c:if>
	<div class="shell-main-footer">
		<span>版权所有-曙阳汽车销售</span>
	</div>
</div>
</body>
</html>