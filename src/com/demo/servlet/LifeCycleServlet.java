package com.demo.servlet;


import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LifeCycleServlet extends HttpServlet {

	
	/**
	 * Constructor of the object.
	 */
	public LifeCycleServlet() {
		super();
		System.out.println("实例化");
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("当前请求是"+req.getMethod());
		//super.service(req, resp);//根据不同请求调用doGe或者doPost方法
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		System.out.println("doPost");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			System.out.println("doGet");
	}

//	@Override
//	public void destroy() {
//		// TODO Auto-generated method stub
//		System.out.println("销毁对象");
//	}
//
//
//

	
	

}
