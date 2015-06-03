package com.news.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.entity.PageBean;
import com.news.entity.Users;
import com.news.service.UserService;
import com.news.service.impl.UserServiceImpl;

public class SearchUserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchUserServlet() {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
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
	private UserService userService=new UserServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pageNo=request.getParameter("pageNo");
		if(pageNo==null||pageNo.equals("")){
			pageNo="1";
		}
		String pageSize=request.getParameter("pageSize");
		if(pageSize==null||pageSize.equals("")){
			pageSize="2";
		}
		
		PageBean pageBean=userService.getUserList(Integer.parseInt(pageNo),Integer.parseInt(pageSize));
		pageBean.setPageNo(Integer.parseInt(pageNo));
		pageBean.setPageSize(Integer.parseInt(pageSize));
		request.setAttribute("pb", pageBean);
		request.getRequestDispatcher("/console/user/users.jsp").forward(request, response);
		
		
	}

}
