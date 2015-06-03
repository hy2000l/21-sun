package com.news.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.entity.Model;
import com.news.service.RoleService;
import com.news.service.impl.RoleServiceImpl;

public class ShowAclServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ShowAclServlet() {
		super();
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	private RoleService roleService=new RoleServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String rid=request.getParameter("rid");
		List<Model> modelList=roleService.getRoleAcl(Integer.parseInt(rid));
		request.setAttribute("models", modelList);
		request.getRequestDispatcher("/console/role/acl2.jsp")
		.forward(request, response);
		
//		List<Model> modelList=modelService.getMenu();
//		request.setAttribute("models", modelList);
//		request.getRequestDispatcher("/console/role/acl.jsp").forward(request, response);
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
