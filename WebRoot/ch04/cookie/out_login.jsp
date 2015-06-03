<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
 <%
 	Cookie[] cookies=request.getCookies();
 	if(cookies!=null){
 		for(int i=0;i<cookies.length;i++){
 			if(cookies[i].getName().equals("user")){
 				cookies[i].setMaxAge(0);
 				response.addCookie(cookies[i]);
 				break;
 			}
 		}
 	}
 	//session.removeAttribute("user");//删除session空间的数据
 	session.invalidate();
 	response.sendRedirect("index.jsp");
  %>   
