package com.news.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.entity.Role;
import com.news.service.RoleService;
import com.news.service.impl.RoleServiceImpl;

public class AddRoleServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddRoleServlet() {
		super();
	}

	private RoleService roleService=new RoleServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String roleName=request.getParameter("roleName");
		Role role=new Role();
		role.setRole(roleName);
		roleService.addRole(role);
		response.sendRedirect("SearchRoleServlet");
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
