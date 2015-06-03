package com.news.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

import com.news.entity.PageBean;
import com.news.service.NewsService;
import com.news.service.impl.NewsServiceImpl;
import com.news.util.JSONDateProcessor;

public class SearchNewsJsonServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchNewsJsonServlet() {
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
	private NewsService newsService=new NewsServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		
		PageBean pb=newsService.getBaseNewsList(1,50);
	
		JsonConfig  config=new JsonConfig();
		config.setExcludes(new String[]{"channelId","isTop","commonCount"});//设置把哪些实体属性排除
		config.registerJsonValueProcessor(Date.class,new JSONDateProcessor("yyyy年MM月dd日"));
	
		JSONObject jsonObject=new JSONObject();
		Map attrs=new HashMap();
		attrs.put("rows",pb.getData());
		attrs.put("total", pb.getRecordCount());
		//jsonObject.put("rows", pb.getData());
		jsonObject.putAll(attrs,config);
		//jsonObject.toString();
		String data=jsonObject.toString();
		System.out.println(data);
		response.getWriter().println(data);

	}

}
