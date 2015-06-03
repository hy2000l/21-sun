package com.news.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleCallableStatement;
import oracle.jdbc.driver.OracleConnection;

import com.news.dao.BaseDao;
import com.news.dao.RoleDao;
import com.news.entity.PageBean;
import com.news.entity.Role;

public class RoleDaoImpl extends BaseDao implements RoleDao {

	
	public PageBean find(int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		String sql="select id,role_name from role order by id";
		ResultSet rs=super.executeQueryForPage(sql, pageNo,pageSize);
		PageBean pb=new PageBean();
		List<Role> roleList=new ArrayList<Role>();
		Role role=null;
		try {
			while(rs.next()){
				role=new Role();
				role.setId(rs.getInt("id"));
				role.setRole(rs.getString("role_name"));
				roleList.add(role);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		pb.setData(roleList);
		pb.setRecordCount(super.executeTotalCount("select count(id) from role"));
		
		return pb;
	}

	public int insert(Role role) {
		// TODO Auto-generated method stub
		String sql="insert into role(id,role_name) values(seq_role_id.nextval,?)";
		return super.executeUpdate(sql,new Object[]{role.getRole()});
	}

	public int delete(int rid) {
		// TODO Auto-generated method stub
		String sql1="delete role where id="+rid;
		String sql2="update uses set r_id=null where r_id="+rid;
		int ret=0;
		Connection conn=super.getConnection();
		Statement state=null;
		try {
			conn.setAutoCommit(false);
			state=conn.createStatement();
			state.addBatch(sql1);
			state.addBatch(sql2);
			state.executeBatch();
			conn.commit();
			ret=1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				state.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return ret;
	}

	public List<Role> find() {
		// TODO Auto-generated method stub
		String sql="select id,role_name from role order by id";
		ResultSet rs=super.executeQuery(sql);
		List<Role> roleList=new ArrayList<Role>();
		Role role=null;
		try {
			while(rs.next()){
				role=new Role();
				role.setId(rs.getInt("id"));
				role.setRole(rs.getString("role_name"));
				roleList.add(role);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return roleList;
	}

	public int deleteByProc(int rid) {
		// TODO Auto-generated method stub
		String sql="{call  prc_delete_role(?,?)}";
		
		OracleConnection conn=(OracleConnection)super.getConnection();
		OracleCallableStatement state=null;
		int ret=0;
		try {
			state=(OracleCallableStatement)conn.prepareCall(sql);
			state.setInt(1, rid);
			state.registerOutParameter(2, Types.NUMERIC);
			state.execute();
			ret=state.getInt(2);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
	}

}
