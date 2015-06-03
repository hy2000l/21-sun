package com.news.service.impl;

import java.util.List;

import com.news.dao.ChannelDao;
import com.news.dao.impl.ChannelDaoImpl;
import com.news.entity.Channel;
import com.news.service.ChannelService;

public class ChannelServiceImpl implements ChannelService {

	private ChannelDao channelDao=new ChannelDaoImpl();
	public List<Channel> getChannelList() {
		// TODO Auto-generated method stub
		return channelDao.findChannelList();
	}

}
