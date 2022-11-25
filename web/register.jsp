<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%
	Random rand=new Random();
	int token=rand.nextInt();
	session.setAttribute("token", token);
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>曙阳汽车销售</title>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
		<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
		<%--引入html5shiv解决ie9以下浏览器对html5新增标签的不识别，并导致CSS不起作用的问题。--%>
		<%--引入respond.min让不支持css3 Media Query的浏览器包括IE6-IE8等其他浏览器支持查询。--%>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
	</head>
	<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="merchant_index.jsp"><b>欢迎注册</b>曙阳汽车销售</a>
		</div>
		<div class="register-box-body">
			<p class="login-box-msg">新用户注册</p>
		<form action="${pageContext.request.contextPath}/user/register" method="POST">
			<!-- 防止表单重复提交,使session域和input存储token -->
			 <input type="hidden" name="token" value="<%=token %>"/>
			<div class="form-group has-feedback">
				<input type="text" class="form-control" name="username" placeholder="用户名"  value="<%=request.getParameter("username")==null?"":request.getParameter("username")%>">
				<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" class="form-control" name="password" placeholder="密码">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" class="form-control" name="password2" placeholder="确认密码">
				<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="text" class="form-control" name="nickname" placeholder="昵称" value="<%=request.getParameter("nickname")==null?"":request.getParameter("nickname")%>">
				<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="text" class="form-control" name="email" placeholder="邮箱">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="text" name="valistr" placeholder="验证码"/>
				<img onclick="changeImage(this)" src="${pageContext.request.contextPath}/image/valiImage" />
				<script>
					function changeImage(thisobj){
						thisobj.src=${pageContext.request.contextPath}+"/image/valiImage?time="+ new Date().getTime();
					}
				</script>
			</div>
			<div class="row">
				<div class="col-xs-8">
					<div class="checkbox icheck">
						<label>
							<a href="${pageContext.request.contextPath}/login.jsp" class="text-center">已有账号？去登录</a>
						</label>
					</div>
				</div>
				<div class="col-xs-4">
					<button type="submit" class="btn btn-primary btn-block btn-flat" class="sub_td" colspan="2" class="tds">注册</button>
				</div>
			</div>
				<tr>
					<td class="sub_td" colspan="2" class="tds">
						${msg }
					</td>
				</tr>
		</form>
		</div>
	</div>
		<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
		<script>
			$(function() {
				$('input').iCheck({
					checkboxClass: 'icheckbox_square-blue',
					radioClass: 'iradio_square-blue',
					increaseArea: '20%' // optional
				});
			});
		</script>
	</body>
</html>
