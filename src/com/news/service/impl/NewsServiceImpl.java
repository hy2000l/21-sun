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
	 * ����ChannelID�����ݿ��ȡ���������б�
	 * @param channelId��0����������  ���㣺Ƶ������
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
	 * �����û������ID������ŵ�����
	 */
	public NormalNews getBaseNews(int id) {
		// TODO Auto-generated method stu
		return newsDao.findById(id);
		
	}
	/**
	 * ������ͨ����
	 */
	public int addNews(NormalNews news) {
		// TODO Auto-generated method stub
		
		return newsDao.insertNormalNews(news);
		
	
	}
	/**
	 * ����ͼƬ����
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
