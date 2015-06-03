package com.demo.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloWorldServlet extends HttpServlet{
	/**
	 * ����get��ʽ������
	 */
	@Override
	public void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException,
			ServletException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//1�������������
		String uname=request.getParameter("uname");
		//���Ӧ�õ�ȫ�ַ�Χ
		ServletContext app=super.getServletContext();
		
		Integer count=(Integer)app.getAttribute("count");
		if(count==null){
			count=1;
		}else{
			count++;
		}
		app.setAttribute("count", count);
		
		//2��ҵ����ʡ��
		//3����Ӧ
		response.getWriter().println("<b>"+uname+"</b>");
		
	}
	/**
	 * ����Post����
	 */
	@Override
	public void doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException,ServletException{
		this.doGet(request, response);
		
	}
}
