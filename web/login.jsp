<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false"%>
<%
	Cookie[] cookies=request.getCookies();
	Cookie remeCk=null;
	for(Cookie ck:cookies){
		if(ck.getName().equals("remname")){
			remeCk=ck;
			/* break; */
		}
	}
	String username="";
	if(remeCk!=null){
		username=remeCk.getValue();
		username= URLDecoder.decode(username,"utf-8");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
		<title>阳の汽车小站欢迎您</title>
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
	</head>
	<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="all-admin-index.html"><b>欢迎进入</b>曙阳登录界面</a>
		</div>
		<form action="${pageContext.request.contextPath}/user/login" method="POST">
			<div class="login-box-body">
				<p class="login-box-msg">登录系统</p>
					<div class="form-group has-feedback">
						<input type="text" name="username" class="form-control" value="${cookie.remeCk.value }" placeholder="商家名">
						<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" name="password" class="form-control" placeholder="密码">
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
				<tr>
					<td colspan="2">
						<input type="checkbox" name="remname" value="false"/>记住用户名
						<input type="checkbox" name="autologin" value="false"/>30天内自动登录
					</td>
				</tr>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<a href="${pageContext.request.contextPath}/register.jsp" class="text-center">没有账号？去注册成为新用户</a><br>
						</div>
					</div>
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<a href="${pageContext.request.contextPath}/merchant_register.jsp" class="text-center">成为商家</a><br>
						</div>
					</div>
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
					</div>
				</div>
				<tr>
					<td class="sub_td" colspan="2" class="tds" style="color: red;padding:0px 0px 0px 70px">
					  	${LoginMsg }
					</td>  
				</tr>
			</div>
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%'
			});
		});
	</script>
	</body>
</html>
