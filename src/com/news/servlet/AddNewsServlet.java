package com.news.servlet;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.news.entity.NormalNews;
import com.news.service.NewsService;
import com.news.service.impl.NewsServiceImpl;
import com.news.util.DateUtil;

public class AddNewsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddNewsServlet() {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String content=request.getParameter("content");
		String time=request.getParameter("stime");
		String title=request.getParameter("title");
		String channel=request.getParameter("channel");
		String sstyle=request.getParameter("style");
		String source=request.getParameter("source");
		String[] simgUrls=request.getParameterValues("simgUrl");
		
		int style=Integer.parseInt(sstyle);
		NormalNews normalNews=new NormalNews();
		normalNews.setSource(source);
		normalNews.setStyle(style);
		normalNews.setTitle(title);
		normalNews.setPublishTime(DateUtil.toDate(time));
		normalNews.setContent(content);
		normalNews.setChannelId(Integer.parseInt(channel));
		if(simgUrls!=null&&simgUrls.length>0){
			if(style==1&&simgUrls.length>=3){//列表样式多图存储缩略图
					String urls="";
					for(int i=0;i<3;i++){//缩略图最多存三张
						if(i<2){
							urls+=simgUrls[i]+",";
						}else{
							urls+=simgUrls[i];
						}
						
					}
					normalNews.setSmallImg(urls);
					//normalNews.setImageList(partList);
			}else{
				normalNews.setSmallImg(simgUrls[0]);
			}
		}
		newsService.addNews(normalNews);
		response.sendRedirect("../console/news/addNews2.html");
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
