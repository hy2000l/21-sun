package com.news.service.impl;

import java.util.List;

import com.news.dao.NewsDao;
import com.news.dao.impl.NewsDaoImpl;
import com.news.entity.BaseNews;
import com.news.entity.ImageNews;
import com.news.entity.ImagePart;
import com.news.entity.NormalNews;
import com.news.entity.PageBean;
import com.news.service.NewsService;

public class NewsServiceImpl  implements NewsService {

	private NewsDao newsDao=new NewsDaoImpl();
	/**
	 * 根据ChannelID从数据库获取所有新闻列表
	 * @param channelId　0：今日新闻  非零：频道新闻
	 */
	public PageBean getBaseNewsList(int channelId,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		PageBean pageBean=null;
		if(channelId==0){
			pageBean=newsDao.findBaseNews(pageNo,pageSize);
		}else{
			pageBean=newsDao.findBaseNewsByChannelId(channelId,pageNo,pageSize);
		}
		return pageBean;
		
	}
	/**
	 * 根据用户传入的ID获得新闻的详情
	 */
	public NormalNews getBaseNews(int id) {
		// TODO Auto-generated method stu
		return newsDao.findById(id);
		
	}
	/**
	 * 发布普通新闻
	 */
	public int addNews(NormalNews news) {
		// TODO Auto-generated method stub
		
		return newsDao.insertNormalNews(news);
		
	
	}
	/**
	 * 发布图片新闻
	 */
	public int addNews(ImageNews news) {
		// TODO Auto-generated method stub
		int ret=0;
		BaseNews baseNews=news;
		int newsId=newsDao.insertBaseNews(baseNews);
		List<ImagePart> partList=news.getImageList();
		if(partList!=null&&partList.size()>0){
			for(ImagePart part:partList){
				part.setNewsId(newsId);
			}
			ret=newsDao.batchInsertImagePart(news.getImageList());
		}
		return ret;
	
	}
	public PageBean getBaseNewsList(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		
		return newsDao.findBaseNews(pageNo, pageSize);
	}
	public int delNews(int id) {
		// TODO Auto-generated method stub
		
		return newsDao.deleteNormalNew(id);
	}


}
