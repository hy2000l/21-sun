package com.news.servlet;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;



import com.news.entity.Channel;
import com.news.service.ChannelService;
import com.news.service.impl.ChannelServiceImpl;

public class GetChannelsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetChannelsServlet() {
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
	private ChannelService service=new ChannelServiceImpl();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	response.setContentType("text/json; charset=utf-8");
	
	List<Channel> channelList=service.getChannelList();
	
	JSONArray jsonArray=JSONArray.fromObject(channelList);
	String jsonChannelList=jsonArray.toString();

	//String jsonChannelList=JSONArray.toJSONString(channelList);
	System.out.println(jsonChannelList);
	response.getWriter().println(jsonChannelList);
	
		
	}

}
