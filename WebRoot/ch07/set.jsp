<%@page import="com.news.entity.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'set.jsp' starting page</title>
    
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
    	Users u=new Users();
    	u.setUserName("admin");
    	u.setPwd("a1234");
    	
    	List userList=new ArrayList();
    	userList.add(u);
    	
    	pageContext.setAttribute("pagevar", "item1");
    	request.setAttribute("uname", "admin");
    	session.setAttribute("user", u);
    	application.setAttribute("list", userList);
    	
     %>
     ${pageScope.pagevar}<br/>
     <input type="text" value="${requestScope['uname'] }"/><br/>
     ${user.userName}<br/>
     ${applicationScope.list[0].pwd }
     
  </body>
</html>
