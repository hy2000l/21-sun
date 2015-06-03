<%@page import="java.util.ArrayList"%>
<%@page import="com.news.entity.BaseNews"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" 
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String sql="select id,title,publish_time from basenews";
	List<BaseNews> newsList=new ArrayList<BaseNews>();
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager
		.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
			"news_user","a1234");
 	PreparedStatement ps=conn.prepareStatement(sql);
 	ResultSet rs=ps.executeQuery();
 	BaseNews news=null;
 	while(rs.next()){
 		news=new BaseNews();
 		news.setId(rs.getInt("id"));
 		news.setTitle(rs.getString("title"));
 		news.setPublishTime(rs.getTimestamp("publish_time"));
 		newsList.add(news);
 	}
 	rs.close();
 	ps.close();
 	conn.close();
 	
 %>
<div>

	<ul>
		<%
			for(BaseNews bnews:newsList){
				
				%>
				<li>
				<a href="news_detail.jsp?id=<%=bnews.getId()%>">
					<%=bnews.getTitle() %></a></li>
				<li><%=bnews.getPublishTime() %></li>
				<%
			}
		 %>
		
	</ul>
</div>
</body>
</html>