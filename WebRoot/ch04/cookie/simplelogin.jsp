<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'simplelogin.jsp' starting page</title>
    
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
   <form action="do_login.jsp" method="post">
   	用户名：<input type="text" name="uname"/><br/>
   	密码:<input type="password"name="pwd"/><br/>
   	是否自动登录：<input type="checkbox" name="save" value="1"/><br/>
   	<input type="submit" value="登录"/>
   </form>
  </body>
</html>
