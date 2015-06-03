package com.news.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.news.dao.BaseDao;
import com.news.dao.ModelDao;
import com.news.entity.Model;

public class ModelDaoImpl extends BaseDao implements ModelDao {

	
	public List<Model> findByParentId(int pid) {
		// TODO Auto-generated method stub
		String sql="select * from model where parent_id=? order by m_order";
		ResultSet rs=super.executeQuery(sql,pid);
		List<Model> list=new ArrayList<Model>();
		Model m=null;
		try {
			while(rs.next()){
				m=new Model();
				m.setId(rs.getInt("id"));
				m.setName(rs.getString("m_name"));
				m.setUrl(rs.getString("m_url"));
				m.setLevel(rs.getInt("m_level"));
				list.add(m);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
			
		}
		return list;
	}

	public List<Model> findByRoleId(int rid) {
		// TODO Auto-generated method stub
		String sql="select model.id,model.m_name,model.m_level " +
				",nvl(t_acl.c,0) state  from  model left  " +
				"join (select m_id,c from acl where r_id=?) " +
				" t_acl on t_acl.m_id=model.id order by m_order";
		ResultSet rs=super.executeQuery(sql,rid);
		List<Model> modelList=new ArrayList<Model>();
		Model model=null;
		try {
			while(rs.next()){
				model=new Model();
				model.setId(rs.getInt("id"));
				model.setName(rs.getString("m_name"));
				model.setLevel(rs.getInt("m_level"));
				model.setCheck(rs.getInt("state"));
				modelList.add(model);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return modelList;
	}

}
