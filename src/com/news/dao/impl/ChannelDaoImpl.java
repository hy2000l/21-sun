package com.news.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.news.dao.BaseDao;
import com.news.dao.ChannelDao;
import com.news.entity.Channel;

public class ChannelDaoImpl extends BaseDao implements ChannelDao {

	public List<Channel> findChannelList() {
		String sql="select id,channel_name from channel order by id";
		ResultSet rs=super.executeQuery(sql);
		List<Channel> channelList=new ArrayList<Channel>();
		Channel channel=null;
		try {
			while(rs.next()){
				channel=new Channel();
				channel.setId(rs.getInt("id"));
				channel.setChannel(rs.getString("channel_name"));
				channelList.add(channel);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return channelList;
	}
//	public static void main(String[] args) {
//		ChannelDaoImpl channelDao=new ChannelDaoImpl();
//		List<Channel> channelList=channelDao.findChannelList();
//		for(Channel ch:channelList){
//			System.out.println(ch.getChannel());
//		}
//	}

}
