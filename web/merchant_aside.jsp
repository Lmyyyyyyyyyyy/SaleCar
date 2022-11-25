<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="main-sidebar">
	<section class="sidebar">
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${pageContext.request.contextPath}/image/logo.jpg"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>
					<%--获取当前正在操作的用户信息--%>
				</p>
				<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
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