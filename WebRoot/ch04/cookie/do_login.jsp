<%@page import="com.news.entity.Users"%>
<%@page import="com.news.service.UserServiceImpl"%>
<%@page import="com.news.service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uname=request.getParameter("uname");
	String pwd=request.getParameter("pwd");
	String save=request.getParameter("save");
	UserService userService=new UserServiceImpl();
	Users user=userService.login(uname, pwd);
	if(user!=null){//登录成功
		if(save!=null&&save.equals("1")){
			Cookie cookie=new Cookie("user",uname);
			cookie.setMaxAge(60*60*24*7);
			response.addCookie(cookie);//向客户端本地写入cookie
		}
		session.setAttribute("user", user);//记录用户登录状态
		
		response.sendRedirect("index.jsp");
	}else{
		response.sendRedirect("simplelogin.jsp");
	}
	
	
 %>
