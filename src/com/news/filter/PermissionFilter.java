package com.news.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.news.entity.Users;
import com.news.service.UserService;
import com.news.service.impl.UserServiceImpl;

public class PermissionFilter extends HttpServlet implements Filter {

	private UserService userService=new UserServiceImpl();
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		Users u=(Users)req.getSession().getAttribute("user");
		if(u==null){
			res.sendRedirect("/21-sun/console/login.jsp");
		}else {
			int rid=u.getRole().getId();
			String path=req.getRequestURI();
			boolean ret=userService.hasPermission(rid, path);
			if(!ret){
				res.sendRedirect("/21-sun/console/common/no_permission.jsp");
				
			}else{
				
				chain.doFilter(request, response);
			}
			
		}
		
		

	}

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	/**
	 * Constructor of the object.
	 */
	public PermissionFilter() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
