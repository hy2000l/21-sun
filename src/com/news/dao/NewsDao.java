package com.news.dao;

import java.util.List;
import com.news.entity.BaseNews;
import com.news.entity.ImagePart;
import com.news.entity.NormalNews;
import com.news.entity.PageBean;

public interface NewsDao {
	
	public NormalNews findById(int id);

	public PageBean findBaseNews(int pageNo,int pageSize);
	
	public PageBean findBaseNewsByChannelId(int channelId,int pageNo,int pageSize);
	
	public int insertNormalNews(NormalNews news);
	
	public int insertBaseNews(BaseNews news);
	
	public int deleteNormalNew(int id);
	
	public int batchInsertImagePart(List<ImagePart> partList);

	
	
	
	
	
	
}
