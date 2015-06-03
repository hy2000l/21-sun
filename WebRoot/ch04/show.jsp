<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'show.jsp' starting page</title>
    
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
  <%=session.getId() %><br/>
   <%
   		//在session范围取浏览过程中user数据
   		String uname=(String)session.getAttribute("user");
   		
   		if(uname==null||uname.equals("")){
   			response.getWriter().println("当前会话范围没有user状态");
   		}else{
   			%>
   			<%=uname %>
   			<% 
   		}
   		
    %>
  </body>
</html>
