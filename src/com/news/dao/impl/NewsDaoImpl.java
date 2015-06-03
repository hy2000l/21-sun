package com.news.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleCallableStatement;
import oracle.jdbc.driver.OracleConnection;
import oracle.sql.STRUCT;
import oracle.sql.StructDescriptor;

import com.news.dao.BaseDao;
import com.news.dao.NewsDao;
import com.news.entity.BaseNews;
import com.news.entity.ImagePart;
import com.news.entity.NormalNews;
import com.news.entity.PageBean;

public class NewsDaoImpl extends BaseDao implements NewsDao {
	public NormalNews findById(int id) {
		String sql="select * from vw_normal_news_detail where id=?";
		ResultSet rs=super.executeQuery(sql,id);
		NormalNews news=null;
		try {
			if(rs.next()){
				news=new NormalNews();
				news.setTitle(rs.getString("title"));
				news.setPublishTime(rs.getTimestamp("publish_time"));
				news.setContent(rs.getString("text"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return news;
	}
	
	
	/**
	 * 获得今日新闻列表
	 */
	public PageBean findBaseNews(int pageNo,int pageSize) {
		String sql="select * from basenews" +
				" order by publish_time desc";
		ResultSet rs=super.executeQueryForPage(sql,
				pageNo,pageSize);
		PageBean pageBean=new PageBean();
		List<BaseNews> baseNewsList=new ArrayList<BaseNews>();
		BaseNews news=null;
		try {
			while(rs.next()){
				news=new BaseNews();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setPublishTime(rs.getTimestamp("publish_time"));
				news.setStyle(rs.getInt("style"));
				news.setSmallImg(rs.getString("smallimgurl"));
				news.setSource(rs.getString("source"));
				baseNewsList.add(news);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		pageBean.setData(baseNewsList);
		sql="select count(*)  from basenews ";
		int total=super.executeTotalCount(sql);
		pageBean.setRecordCount(total);
		pageBean.setPageCount(total%pageSize==0?total/pageSize:total/pageSize+1);
		return pageBean;
	}
	
	public PageBean findBaseNewsByChannelId(int channelId,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		String sql="select id,title,publish_time from basenews " +
				"where channel=? order by publish_time desc";
		ResultSet rs=super.executeQueryForPage(sql, new Object[]{channelId,pageNo*pageSize,(pageNo-1)*pageSize});
		PageBean pageBean=new PageBean();
		List<BaseNews> baseNewsList=new ArrayList<BaseNews>();
		BaseNews news=null;
		try {
			while(rs.next()){
				news=new BaseNews();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setPublishTime(rs.getTimestamp("publish_time"));
				baseNewsList.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		pageBean.setData(baseNewsList);
		sql="select count(id) from basenews " +
				"where channel=?";
		int recordCount=super.executeTotalCount(sql,new Object[]{channelId});
		pageBean.setRecordCount(recordCount);
		pageBean.setPageCount(recordCount%pageSize==0?recordCount/pageSize:recordCount/pageSize+1);
		return pageBean;
	}

	/**
	 * 插入成功，返回记录的id
	 */
	public int  insertBaseNews(BaseNews news) {
		// TODO Auto-generated method stub
		
		String sql="insert into news(id,title,publish_time,source,comments,smallimgurl,istop,type,style,channel,parent_id)" +
				" values(seq_news_id.nextval,?,?,?,?,?,?,?,?,?,?)";
		int ret=super.executeUpdate(sql,new Object[]{news.getTitle(),new java.sql.Date(news.getPublishTime().getTime()),
		news.getSource(),0,news.getSmallImg(),news.getIsTop(),news.getType(),news.getStyle(),news.getChannelId(),news.getParentId()});
		if(ret==1){
			sql="select max(id) from news";
			ret=super.executeQueryForNewId(sql);
		}
		return ret;
	}





//	public int insertNormalNews(NormalNews news) {
//		// TODO Auto-generated method stub
//		String sql="insert into basenews(id,title,publish_time,source,comments,smallimgurl,istop,type,style,channel,parent_id)" +
//				" values(seq_news_id.nextval,?,?,?,?,?,?,?,?,?,?)";
//		int ret=super.executeUpdate(sql,new Object[]{news.getTitle(),new java.sql.Date(news.getPublishTime().getTime()),
//		news.getSource(),0,news.getSmallImg(),news.getIsTop(),news.getType(),news.getStyle(),news.getChannelId(),news.getParentId()});
//		if(ret==1){
//			sql="select max(id) from basenews";
//			ret=super.executeQueryForNewId(sql);
//			sql="insert into normalnews(id,text) values(?,?)";
//			super.executeUpdate(sql,new Object[]{ret,news.getContent()});
//		}
//		return ret;
//	}
	public int insertNormalNews(NormalNews news){
		int ret=0;
		String sql="{call proc_insert_normalnews(?)}";
		Connection conn=super.getConnection();
		OracleCallableStatement  state=null;
		try {
			state=(OracleCallableStatement)conn.prepareCall(sql);
			StructDescriptor desc=new StructDescriptor("TYPE_NORMALNEWS", conn);
			Object[] params=new Object[12];
			params[0]=0;
			params[1]=news.getTitle();
			params[2]=new java.sql.Date(news.getPublishTime().getTime());
			params[3]=news.getSource();
			params[4]=news.getCommonCount();
			params[5]=news.getSmallImg();
			params[6]=news.getIsTop();
			params[7]=news.getType();
			params[8]=news.getStyle();
			params[9]=news.getChannelId();
			params[10]=news.getParentId();
			params[11]=news.getContent();
			STRUCT struct=new STRUCT(desc, conn, params);
			state.setSTRUCT(1, struct);
			state.execute();
			ret=1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ret;
		
	}


	public int batchInsertImagePart(List<ImagePart> partList) {
		// TODO Auto-generated method stub		
		String sql="insert into imagepart(id,imgurl,img_title,img_desc,img_order,news_id) values(seq_imagepart_id.nextval,?,?,?,?,?)";
		Connection con=super.getConnection();
		PreparedStatement ps=null;
		int ret=0;
		try {
			ps=con.prepareStatement(sql);
			for(ImagePart part:partList){
				ps.setString(1, part.getImgUrl());
				ps.setString(2, part.getImgTilte());
				ps.setString(3, part.getImgDesc());
				ps.setInt(4, part.getImgOrder());
				ps.setInt(5,part.getNewsId());
				ps.addBatch();
			}
			ps.executeBatch();
			ret=1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		return ret;
	}

	/**
	 * 删除普通新闻,执行批语句
	 */
	public int deleteNormalNew(int id) {
		// TODO Auto-generated method stub
		int ret=0;
		String sql1="delete from basenews where id="+id;
		String sql2="delete from normalnews where id="+id;
		Connection conn=super.getConnection();
		Statement state=null;
		try {
			state=conn.createStatement();
			state.addBatch(sql1);
			state.addBatch(sql2);
			state.executeBatch();
			ret=1;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
				try {
					if(state!=null) state.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		return ret;
	}


//	public int batchInsertBaseImagePart(List<BaseImagePart> basePartList) {
//		// TODO Auto-generated method stub
//		return 0;
//		
//	}
	

}
