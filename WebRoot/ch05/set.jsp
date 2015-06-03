<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
>

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
  String uname=request.getParameter("uname");
  pageContext.setAttribute("pageScope", uname);
// HttpServletRequest req=(HttpServletRequest)pageContext.getRequest();
 //HttpSession ses=req.getSession();
 //ServletContext app =pageContext.getServletContext();
  
  request.setAttribute("requestScope", uname);
  session.setAttribute("sessionScope", uname);
  application.setAttribute("appScope",uname);
  
 // response.sendRedirect("get.jsp");//重定向
   	//请求转发
   	//RequestDispatcher rd=request.getRequestDispatcher("get.jsp");
   	//rd.forward(request, response);
  	request.getRequestDispatcher("get.jsp").
  	forward(request,response);

   %>
   
  </body>
</html>
