package com.news.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.news.dao.AclDao;
import com.news.dao.BaseDao;


public class AclDaoImpl extends BaseDao implements AclDao {
	public int findAcl(int rid, int mid) {
		String sql="select c from acl where r_id=? and m_id=?";
		ResultSet rs=super.executeQuery(sql,new Object[]{rid,mid});
		int ret=0;
		try {
			if(rs.next()){
					ret=rs.getInt("c");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return ret;
	}

	public int findAcl(int rid, String url) {
		String sql="select c from acl where r_id=? and m_id=" +
				"(select id from model where m_url=?) ";
		ResultSet rs=super.executeQuery(sql,new Object[]{rid,url});
		int ret=0;
		try {
			if(rs.next()){
				ret=rs.getInt("c");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return ret;
	}

	public List<Integer> findModelId(int rid) {
		// TODO Auto-generated method stub
		String sql="select m_id from acl where r_id=?";
		ResultSet rs=super.executeQuery(sql,rid);
		List<Integer> list=new ArrayList<Integer>();
		try {
			while(rs.next()){
				list.add(rs.getInt("m_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return list;
	}

	public int delete(int rid) {
		// TODO Auto-generated method stub
		String sql="delete from acl where r_id=?";
		return super.executeUpdate(sql,new Object[]{rid});
	}

	public int batchInsert(int rid, String[] mid) {
		// TODO Auto-generated method stub
		String sql="insert into acl(id,r_id,m_id,c) " +
				"values(seq_acl_id.nextval,?,?,1)";
		Connection conn=super.getConnection();
		int ret=0;
		PreparedStatement pstm=null;
		try {
			conn.setAutoCommit(false);
			pstm=conn.prepareStatement(sql);
			for(int i=0;i<mid.length;i++){
				pstm.setInt(1,rid);
				pstm.setInt(2,Integer.parseInt(mid[i]));
				pstm.addBatch();
			}
			pstm.executeBatch();
			conn.commit();
			ret=1;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
				try {
					if(pstm!=null)pstm.close();
					if(conn!=null)conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		return ret;
	}

}
