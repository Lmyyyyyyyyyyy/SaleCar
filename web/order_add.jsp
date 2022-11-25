<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	<link href="${pageContext.request.contextPath}/css/addOrder.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="warp">
		<form action="${pageContext.request.contextPath}/order/addOrder" name="form1" method="post">
			<h3>增加订单</h3>
			<div id="forminfo">
				<span class="lf" style="vertical-align: middle;">收货地址：</span> 
				<label for="textarea"></label>
				<textarea name="receiverinfo" id="textarea" cols="35" rows="3">广东省广州市天河区广东工贸职业技术学院1098号</textarea>
				<br> 支付方式：<input name="" type="radio" value="" checked="checked">&nbsp;在线支付
			</div>
			<table width="1200" height="80" border="1" cellpadding="0" cellspacing="0" bordercolor="#d8d8d8">
				<tr>
					<th width="276">商品图片</th>
					<th width="247">商品名称</th>
					<th width="231">商品单价</th>
					<th width="214">购买数量</th>
					<th width="232">总价</th>
				</tr>
				<c:set var="totalMoney" value="0" />
					<c:forEach items="${ cartmap }" var="entry">
						<tr>
							<td>${ entry.key.name }</td>
							<td>${ entry.key.category }</td>
							<td>${ entry.key.price }</td>
							<td>${ entry.value }件</td>
							<td>${ entry.key.price * entry.value }元</td>
						</tr>
					<c:set var="totalMoney" value="${ totalMoney+( entry.key.price * entry.value ) }" />
				</c:forEach>

			</table>
			<div class="Order_price">总价：${ totalMoney }元</div>
			<div class="add_orderbox">
				<input name="" type="submit" value="增加订单" class="add_order_but">
			</div>
		</form>
	</div>

</body>
</html>
