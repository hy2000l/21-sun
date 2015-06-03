<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'do_reg.jsp' starting page</title>
    
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
   	String uname=request.getParameter("name");
   	String pwd=request.getParameter("pwd");
   	String sex=request.getParameter("sex");
   	String edu=request.getParameter("edu");
   	String[] channels=request.getParameterValues("channel");
   	 %>
   	 客户端IP：<%=request.getRemoteAddr() %><br/>
   	 你的名称：<%=uname %><br/>
   	 你的密码：<%=pwd %><br/>
   	 <%=sex %><br/>
   	 <%=edu %><br/>
   	 <ul>
   	 <%
   	 	for(int i=0;i<channels.length;i++){
   	 	
   	 	%>
   	 		<li><%=channels[i] %></li>
   	 	<%
   	 	}
   	  %>
   	  </ul>
  </body>
</html>
