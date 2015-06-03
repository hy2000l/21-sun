<%@ page language="java" 
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="show.jsp?id=2&style=1">新闻标题</a>
	<br/>
	<form action="show.jsp" method="get" name="myfrm">
		<input type="hidden" name="id" value="2"/>
		<input type="hidden" name="style" value="1"/>
		<a href="javascript:myfrm.submit();">新闻标题</a>
	</form>
</body>
</html>