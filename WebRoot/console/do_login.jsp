<%@page import="com.news.entity.Users"%>
<%@page import="com.news.service.UserServiceImpl"%>
<%@page import="com.news.service.UserService"%>
<%@ page language="java"
    pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String uname=request.getParameter("uname");
	String upwd=request.getParameter("pwd");
	UserService userService=new UserServiceImpl();
	Users u=userService.login(uname, upwd);
	if(u!=null){
		//对应浏览器在服务器session空间，存储数据
		session.setAttribute("user", u);
		response.sendRedirect("default.jsp");
	}else{
		response.sendRedirect("login.jsp");
	}
 %>
