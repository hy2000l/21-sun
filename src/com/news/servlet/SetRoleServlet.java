package com.news.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.service.UserService;
import com.news.service.impl.UserServiceImpl;

public class SetRoleServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SetRoleServlet() {
		super();
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	private UserService userService=new UserServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uid=request.getParameter("uid");
		String rid=request.getParameter("role");
		userService.setRole(Integer.parseInt(uid), Integer.parseInt(rid));
		response.sendRedirect("SearchUserServlet");
	}

}
