package com.news.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.entity.PageBean;
import com.news.entity.Users;
import com.news.service.NewsService;
import com.news.service.UserService;
import com.news.service.impl.NewsServiceImpl;
import com.news.service.impl.UserServiceImpl;

public class SearchBaseNewsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchBaseNewsServlet() {
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
	private NewsService newsService=new NewsServiceImpl();
	private UserService userService=new UserServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("utf-8");
//		String mid=request.getParameter("mid");
//		if(mid==null||mid.equals("")){
//			mid="0";
//		}
//		String path=request.getRequestURI();
//		Users u=(Users)request.getSession().getAttribute("user");
//		int rid=u.getRole().getId();
//		boolean ret=userService.hasPermission(rid, path);
//		
//		if(!ret){
//			response.sendRedirect("/21-sun/console/common/no_permission.jsp");
//		}else{
		
			//1、接受请求数据
			String pageNo=request.getParameter("pageNo");
			String pageSize=request.getParameter("pageSize");
			if(pageNo==null||pageNo.equals("")){
				pageNo="1";
			}
			if(pageSize==null||pageNo.equals("")){
				pageSize="10";
			}
			//2、调用业务功能
			PageBean pageBean=newsService.getBaseNewsList(Integer.parseInt(pageNo),
					Integer.parseInt(pageSize));
			pageBean.setPageNo(Integer.parseInt(pageNo));
			pageBean.setPageSize(Integer.parseInt(pageSize));
			
			//3、状态保存
			request.setAttribute("pageBean", pageBean);
			//4、转页面
			//response.sendRedirect("/21-sun/console/news/news_list.jsp");
			request.getRequestDispatcher("/console/news/news_list.jsp")
			.forward(request, response);
		}
		
	//}

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
