<%@page import="com.news.entity.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
    
    <title>My JSP 'index.jsp' starting page</title>
    
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
    <div id="userDiv">
    <%
    	Cookie[] cookies=request.getCookies();//获取客户本地的所有cookie
     	Cookie foundCookie=null;
     	if(cookies!=null){
     		for(int i=0;i<cookies.length;i++){
     			if(cookies[i].getName().equals("user")){
     				foundCookie=cookies[i];
     				break;
     			}
     		}	
     	}
     %>
 	<%Users u=(Users)session.getAttribute("user");//取浏览器的登录状态
 	if(foundCookie!=null||u!=null){ 
 		String uname="";
 		if(foundCookie!=null){
 			uname=foundCookie.getName();
 		}else{
 			uname=u.getUserName();
 		}
 		
 	%>
 		<%=uname %>，<a href="out_login.jsp">注销</a>
 	<%}else{ %>    
   		<a href="simplelogin.jsp">登录</a>
    <%} %>
    </div>
  </body>
</html>
