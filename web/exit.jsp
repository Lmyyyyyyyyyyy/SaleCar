<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.getSession().removeAttribute("user");
	response.sendRedirect(request.getContextPath()+"/index.jsp");
%>