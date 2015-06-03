package com.news.dao;

import java.util.List;

import com.news.entity.Channel;

public interface ChannelDao {
	public List<Channel> findChannelList();
}
