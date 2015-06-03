<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'add_news.jsp' starting page</title>
    
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
   <form action="upload.jsp"  method="post" 
   enctype="multipart/form-data">
   	标题：<input type="text" name="title"/><br/>
   	内容：<textarea rows="10" cols="30" name="content">
   	
   	</textarea><br/>
   	选择图片：<input type="file" name="file"/><br/>
   	<input type="submit" value="提交"/>
   	
   </form>
  </body>
</html>
