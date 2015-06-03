<%@page import="com.news.entity.Users"%>
<%@page import="com.news.service.UserServiceImpl"%>
<%@page import="com.news.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'update_user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<%
  		request.setCharacterEncoding("utf-8");
  		String id=request.getParameter("id");
  		String uname=request.getParameter("userName");
  		String pwd=request.getParameter("pwd");
  		Users user=new Users();
  		user.setId(Integer.parseInt(id));
  		user.setUserName(uname);
  		user.setPwd(pwd);
  		UserService userService=new UserServiceImpl();
  		userService.updateUser(user);
  		response.sendRedirect("users.jsp");
  		
  	 %>
  </body>
</html>
