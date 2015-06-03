<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
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
  <%
  //获取站点所写的cookies
  Cookie[] cookies=request.getCookies();
  Cookie birthdayCookie=null;
  for(int i=0;i<cookies.length;i++){
  	if(cookies[i].getName().equals("user_birthday")){
  		birthdayCookie=cookies[i];
  		break;
  	}
  }
  if(birthdayCookie!=null){
  	String myBirthday=birthdayCookie.getValue();
  	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
  	Date myDate=sdf.parse(myBirthday);
  	Calendar c=Calendar.getInstance();
  	int currMonth=c.get(Calendar.MONTH);
  	int currDay=c.get(Calendar.DAY_OF_MONTH);
  	c.setTime(myDate);
   	int myMonth=c.get(Calendar.MONTH);
  	int myDay=c.get(Calendar.DAY_OF_MONTH);
  	if(myMonth==currMonth&&myDay==currDay){
  		%>
  		今天是你的生日，祝您生日快乐！
  		<% 
  	}
  	
  	
  }
   %>
  </body>
</html>
