package com.demo.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorldServlet extends HttpServlet{
	/**
	 * 处理get方式的请求
	 */
	@Override
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException,
			ServletException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//1、获得请求数据
		String uname=request.getParameter("uname");
		//获得应用的全局范围
		ServletContext app=super.getServletContext();
		
		Integer count=(Integer)app.getAttribute("count");
		if(count==null){
			count=1;
		}else{
			count++;
		}
		app.setAttribute("count", count);
		
		//2、业务处理（省）
		//3、响应
		response.getWriter().println("<b>"+uname+"</b>");
		
	}
	/**
	 * 处理Post请求
	 */
	@Override
	public void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException,ServletException{
		this.doGet(request, response);
		
	}
}
