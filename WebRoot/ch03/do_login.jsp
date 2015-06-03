<%@page import="com.news.entity.Users"%>
<%@page import="com.news.service.UserServiceImpl"%>
<%@page import="com.news.service.UserService"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'do_login.jsp' starting page</title>  
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
 		String uname=request.getParameter("uname");
 		String upass=request.getParameter("pwd");
 		PrintWriter pw=response.getWriter();
 		//调用业务功能
 		UserService userService=new UserServiceImpl();
 		Users user=userService.login(uname, upass);
 		
 		
 		if(user!=null){
 		
 			response.sendRedirect("/21-sun/console/index.html");
 			
 			//pw.println("<b>登录成功！</b>");
 		}else{
 			
 		
 			response.sendRedirect("simplelogin.jsp");
 		}
 	 %>
  </body>
</html>
