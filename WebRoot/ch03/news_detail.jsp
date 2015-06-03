<%@page import="com.news.entity.NormalNews"%>
<%@page import="com.news.dao.NewsDao"%>
<%@page import="com.news.dao.impl.NewsDaoImpl"%>
<%@ page language="java" 
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div>
	<%
		String id=request.getParameter("id");
		NewsDao newsDao=new NewsDaoImpl();
		NormalNews news=newsDao.findById(Integer.parseInt(id));
		
	 %>
	<h1><%=news.getTitle() %></h1>
	<h3><%=news.getPublishTime() %></h3>
	<hr/>
	<p>
		<%=news.getContent() %>
	</p>
</div>
</body>
</html>