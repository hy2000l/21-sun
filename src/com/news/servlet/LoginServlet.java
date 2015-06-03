package com.news.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.news.entity.Model;
import com.news.entity.Users;
import com.news.service.ModelService;
import com.news.service.UserService;
import com.news.service.impl.ModelServiceImpl;
import com.news.service.impl.UserServiceImpl;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
	private ModelService modelService=new ModelServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("执行LoginServlet");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//1、获得请求数据
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		//2、调用业务功能
		Users users=userService.login(uname, pwd);
		if(users!=null){
			HttpSession session=request.getSession();//session
			//3、保存状态
			session.setAttribute("user", users);
			List<Model> menuList=modelService.getMenu();
			session.setAttribute("menus", menuList);
			//4、转页面
			response.sendRedirect("../console/default.jsp");
		}else{
			/**
			 * 在服务端处理的路径
			 * web.xml配置、request.getRequestDispactcher(url).forward(req,res); 
			 *  ‘/’表示当前项目
			 *  在客户端处理的路径
			 *  a、form、response.sendRedirect(url)
			 *  '/'表示webapps，指定站点目录
			 */
			
			response.sendRedirect("/21-sun/console/login.jsp");
		}
		
	}

}
