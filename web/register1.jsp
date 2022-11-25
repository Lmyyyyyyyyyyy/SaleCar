<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>阳の汽车小站</title>
		<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/user/register" method="POST">
			<!-- 防止表单重复提交,使session域和input存储token -->
			<%
				Random rand=new Random();	
				int token=rand.nextInt();
				session.setAttribute("token", token);
			 %>
			 <input type="hidden" name="token" value="<%=token %>"/>
			<h1>欢迎注册阳の汽车小站</h1>
			<table>
				<tr>
					<td class="tds">用户名：</td>
					<td>
						<input type="text" name="username" value="<%=request.getParameter("username")==null?"":request.getParameter("username")%>"/>
					</td>
				</tr>
				<tr>
					<td class="tds">密码：</td>
					<td>
						<input type="password" name="password"/>
					</td>
				</tr>
				<tr>
					<td class="tds">确认密码：</td>
					<td>
						<input type="password" name="password2"/>
					</td>
				</tr>
				<tr>
					<td class="tds">昵称：</td>
					<td>
						<input type="text" name="nickname" value="<%=request.getParameter("nickname")==null?"":request.getParameter("nickname")%>"/>
					</td>
				</tr>
				<tr>
					<td class="tds">邮箱：</td>
					<td>
						<input type="text" name="email" value="a@163.com"/>
					</td>
				</tr>
				<tr>
					<td class="tds">验证码：</td>
					<td>
						<input type="text" name="valistr"/>
						<img onclick="changeImage(this)" src="${pageContext.request.contextPath}/image/valiImage" />
					</td>
					<script>
					function changeImage(thisobj){
						thisobj.src=${pageContext.request.contextPath}+"/image/valiImage?time="+ new Date().getTime();
					}
					</script>
				</tr>
				<tr>
					<td class="sub_td" colspan="2" class="tds">
						<input type="submit" value="注册用户"/>
					</td>
				</tr>
				<tr>
					<td class="sub_td" colspan="2" class="tds">
						${msg }
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
