<%@page import="com.news.entity.Users"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/common/base_path.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'testjstl.jsp' starting page</title>
    
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
  		Users user=new Users();
  		user.setUserName("admin");
  		session.setAttribute("users", user);
  		session.setAttribute("score", 80);
  		//<60 不及格
  		//60~70及格
  		//70~80良好
  		//>=80优秀
  	 %>
   <c:if test="${sessionScope.users!=null}"
    var="ret" scope="request">
   		${sessionScope.users.userName}
   </c:if>
   ${requestScope.ret }<br/>
   <c:if test="${sessionScope.score<60}">
   	不及格
   </c:if>
     <c:if test="${sessionScope.score>=60&&sessionScope.score<70}">
   	及格
   </c:if>
      <c:if test="${score>=70&&score<80}">
   良好
   </c:if>
   <c:if test="${score>=80 }">
   	优秀
   </c:if>
   <table>
   <c:forEach var="i" begin="1" end="10" step="1">
   		<tr><td>序号：</td><td>${i }</td></tr>
   </c:forEach>
    </table>
   <c:set var="uname" value="admin" scope="session"/>
   <c:out value="${sessionScope.uname }"/><br/>
   ${sessionScope.uname }
   <c:if test="${!empty uname }">
   		存在
   </c:if>
   <br/>
   <c:remove var="uname" scope="session"/>
      <c:if test="${empty uname }">
   		已经删除
   </c:if>
  
   
  </body>
</html>
