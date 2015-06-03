<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page  language="java"  import="java.text.SimpleDateFormat"
	  contentType="text/html; charset=utf-8"%>
<%@page import="java.util.Date"%>
<html>
  <head>
    <title>My JSP 'show_date.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
		div{
		font-size:18px;
		color:#ff0000;
		}
	</style>
	<%!
  	private String getDate(){
  		Date now=new Date();
 		SimpleDateFormat sdf=new 
  					SimpleDateFormat("yyyy-MM-dd");
  		String strDate=sdf.format(now);
  		return strDate;
  	} 
   %>
	
  </head>
  
  <body>
  
  <%
  		String strDate=getDate();
  	
   %>
  <div >
  <!-- 把java数据输出给客户端 -->
  <%-- jsp注释--%>
  	<%= strDate%><br/>
  	<%=getDate() %>
  </div>
  
  </body>
</html>
