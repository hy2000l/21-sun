<%@page import="com.news.entity.BaseNews"%>
<%@page import="com.news.entity.PageBean"%>
<%@page import="com.news.service.NewsService"%>
<%@page import="com.news.service.impl.NewsServiceImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    <title>My JSP 'news_list.jsp' starting page</title>
    
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
  <div>
  <%
  	String channelId=request.getParameter("channel_id");
  	String pageNo=request.getParameter("pageNo");
  	if(pageNo==null||pageNo.equals("")){
  		pageNo="1";
  	}
  	if(channelId==null||channelId.equals("")){
  		channelId="0";
  	}
  	NewsService newsService=new NewsServiceImpl();
  	PageBean pageBean=newsService.getBaseNewsList(Integer.parseInt(channelId), 
  	Integer.parseInt(pageNo), 10);
   %>
  	<table>
  		<% int order=(Integer.parseInt(pageNo)-1)*10;
  			for(int i=0;i<pageBean.getData().size();i++){
  				BaseNews news=(BaseNews)pageBean.getData().get(i);
  		 %>
  			<tr><td><%=order+i+1 %><td><%=news.getTitle() %></td><td><%=news.getPublishTime() %></td></tr>
  		<%
  			}
  		 %>
  	</table>
  
  </div>
  <div>
  <br/>
  	<a href="news_list.jsp?pageNo=1">首页</a>
  	<%
  		if(pageNo.equals("1")){
  	 %>
  	上一页
  	<%}else{ 
  	 %>
  	 <a href="news_list.jsp?pageNo=<%=Integer.parseInt(pageNo)-1%>">上一页</a>
  	 <%}
  	  if(Integer.parseInt(pageNo)==pageBean.getPageCount()){
  	  %>
  	 下一页
  	  <%}else{%>
  	<a href="news_list.jsp?pageNo=<%=Integer.parseInt(pageNo)+1%>">下一页</a>
  	<%
  		}
  	 %>
  	<a href="news_list.jsp?pageNo=<%= pageBean.getPageCount() %>">尾页</a>
  	<form action="news_list.jsp" method="get" target="_self">
  		<input type="text" size="4" name="pageNo" value="1"/>
  		<input type="submit" value="go"/>
  	</form>
  
  </div>
  </body>
</html>
