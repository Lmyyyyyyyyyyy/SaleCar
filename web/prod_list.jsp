<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>曙阳汽车销售</title>
<link rel="stylesheet" href="<%=basePath%>/css/index1.css">
<link rel="stylesheet" href="<%=basePath%>/css/all.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="<%=basePath%>/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="<%=basePath%>/css/style1.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="<%=basePath%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="<%=basePath%>/js/simpleCart.min.js"> </script>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	<link href="${pageContext.request.contextPath}/css/prodList.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="shell">
<div class="shell-top">
	<div class="word">
		<h2>Welcome to</h2>
		<h2>曙阳汽车销售中心</h2>
	</div>
	<video>
		<source src="synth city by VISUALDON 4K 60 FPS.mp4" type="video/mp4" />
	</video>
</div>
<div class="shell-main">
	<div class="shell-main-nav">
		<div class="logo">
			<img src="${pageContext.request.contextPath}/image/logo.jpg" alt="">
			<span>曙阳汽车销售</span>
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
	<div id="content">
		<div id="search_div">
			<form method="post" action="${pageContext.request.contextPath}/product/findProductsByCondition">
				<span class="input_span">商品名：<input type="text" name="name"/></span>
				<span class="input_span">商品种类：<input type="text" name="category"/></span>
				<span class="input_span">商品价格区间：<input type="text" name="minprice"/> - <input type="text" name="maxprice"/></span>
				<input type="submit" value="查 询">
			</form>
		</div>
		<div id="prod_content">
		<c:forEach items="${list }" var="prod">
		
			<div class="prod_div">
				<a href ="${pageContext.request.contextPath}/product/findProductInfo?pid=${prod.id}" >
				<img src="${pageContext.request.contextPath}/product/findProductImgByUrl?imgurl=${prod.imgurl}"/>
				</a>
				<div id="prod_name_div">
				<a href ="${pageContext.request.contextPath}/product/findProductInfo?pid=${prod.id}" >
					${prod.name}
				</a>
				</div>
				<div id="prod_price_div">
					￥ ${prod.price} 元
				</div>
				<div>
					<div id="gotocart_div">
						<a href="${pageContext.request.contextPath}/cart/addProductToCart?pid=${prod.id}&buyNum=1">加入购物车</a>
					</div>					
					<div id="say_div">
						133人评价
					</div>					
				</div>
			</div>
			</c:forEach>
			<div style="clear: both"></div>
		</div>
	</div>
	<div class="shell-main-footer">
		<span>版权所有-曙阳汽车销售</span>
	</div>
</div>
</div>
	<style type="text/css">
		#prod_name_div a{
			text-decoration: none;
			font-size: 1.3em;
			color: gray;
		}
		#prod_name_div a:hover{
			text-decoration: underline;
			font-size: 1.3em;
			color: orange;
		}

	</style>

</body>
<script>
	window.addEventListener('scroll', function () {
		let top = window.scrollY
		if (top != 0) {
			$('.shell-top').css('top', '-100vh')
			$('.shell-main').css('top', '0')
			$('.shell-main-lbt-word').css('transform', 'translateY(0px)')
			$('.shell-main-lbt-word').css('backdrop-filter', 'blur(5px)')
			$('.shell-main-lbt-word h2').css('transform', 'translate(0px)')
			$('.shell-main-lbt-word span').css('transform', 'translate(0px)')

		} else {
			$('.shell-top').css('top', '0px')
			$('.shell-main').css('top', '100vh')
			$('.shell-main-lbt-word').css('transform', 'translateY(400px)')
			$('.shell-main-lbt-word').css('backdrop-filter', 'blur(0px)')
			$('.shell-main-lbt-word h2').css('transform', 'translate(520px)')
			$('.shell-main-lbt-word span').css('transform', 'translate(-620px)')
		}
		if (top > 650) {
			$('.shell-main-header-left-top').css('opacity', '1')
			$('.shell-main-header-left-top').css('transform', 'translateY(0px)')
			$('.shell-main-header-left-bottom').css('opacity', '1')
			$('.shell-main-header-left-bottom').css('transform', 'translateY(0px)')
			$('.shell-main-header-left-footer').css('opacity', '1')
			$('.shell-main-header-left-footer').css('transform', 'translateY(0px)')
		} else {
			$('.shell-main-header-left-top').css('opacity', '0')
			$('.shell-main-header-left-top').css('transform', 'translateY(400px)')
			$('.shell-main-header-left-bottom').css('opacity', '0')
			$('.shell-main-header-left-bottom').css('transform', 'translateY(400px)')
			$('.shell-main-header-left-footer').css('opacity', '0')
			$('.shell-main-header-left-footer').css('transform', 'translateY(400px)')
		}
	})
	let left = document.querySelector(".button-left")
	let right = document.querySelector(".button-right")
	let min = document.querySelectorAll(".min")
	let images = document.querySelector(".images")
	let index = 0
	let time
	function position() {
		images.style.left = (index * -100) + "%"
	}
	function add() {
		if (index >= min.length - 1) {
			index = 0
		} else {
			index++
		}
	}
	function desc() {
		if (index < 1) {
			index = min.length - 1
		} else {
			index--
		}
	}

	function timer() {
		time = setInterval(() => {
			index++
			desc()
			add()
			position()
		}, 34000)
	}

	left.addEventListener("click", () => {
		desc()
		position()
		clearInterval(time)
		timer()
	})
	// 右边的按钮和左边也是差不多
	right.addEventListener("click", () => {
		add()
		position()
		clearInterval(time)
		timer()
	})

	for (let i = 0; i < min.length; i++) {
		min[i].addEventListener("click", () => {
			index = i
			position()
			clearInterval(time)
			timer()
		})
	}

	timer()
</script>
</html>
