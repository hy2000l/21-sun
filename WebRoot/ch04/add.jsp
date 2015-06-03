<%@ page language="java" import="java.util.*"
 pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'add.jsp' starting page</title>
    
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
   	//获得用户出生日期
   	String birthday=request.getParameter("birthday");
   	//创建Cookie
   	Cookie  cookie=new Cookie("user_birthday",birthday);
   	cookie.setMaxAge(60*60*24*12*5);
   	//写入Cookie
   	response.addCookie(cookie);
    %>
    注册成功
  </body>
</html>
