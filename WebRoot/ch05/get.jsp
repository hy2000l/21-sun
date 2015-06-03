<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'get.jsp' starting page</title>
    
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
   	String pageValue=(String)pageContext.getAttribute("pageScope");
   	String requestValue=(String)request.getAttribute("requestScope");
   	String sessionValue=(String)session.getAttribute("sessionScope");
   	String appValue=(String)application.getAttribute("appScope");
    %>
    Page:<%=pageValue %><br/>
    Request:<%=requestValue %><br/>
    Session:<%=sessionValue %><br/>
    Application:<%=appValue %>
  </body>
</html>
