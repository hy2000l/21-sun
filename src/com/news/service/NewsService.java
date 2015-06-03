package com.news.service;

import com.news.entity.ImageNews;
import com.news.entity.NormalNews;
import com.news.entity.PageBean;

public interface NewsService {
	public PageBean getBaseNewsList(int channelId,int pageNo,int pageSize);
	
	public PageBean getBaseNewsList(int pageNo,int pageSize);
	
	public NormalNews getBaseNews(int id);
	
	public int addNews(NormalNews news);
	
	public int addNews(ImageNews news);
	
	public int delNews(int id);
}
