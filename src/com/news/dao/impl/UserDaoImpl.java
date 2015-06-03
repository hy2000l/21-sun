package com.news.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.news.dao.BaseDao;
import com.news.dao.UserDao;
import com.news.entity.PageBean;
import com.news.entity.Role;
import com.news.entity.Users;

public class UserDaoImpl extends BaseDao implements UserDao {
	
	public int insert(Users user){
		String sql="insert into uses(id,user_name,pwd) " +
				"values(seq_user_id.nextval,?,?)";
		
		int ret= super.executeUpdate(sql,new Object[]{user.getUserName(),user.getPwd()});
		if(ret==1){
			sql="select max(id) from uses";
			ret=super.executeQueryForNewId(sql);
		}
		return ret;
		
	}
	public int delete(int uid){
		String sql="delete uses where id=? ";
		return  super.executeUpdate(sql,new Object[]{uid});
	}
	public Users findByName(String uname) {
		// TODO Auto-generated method stub
		String sql="select * from vw_user_info where user_name=? ";
		ResultSet rs=super.executeQuery(sql,uname);
		Users user=null;
		try {
			if(rs.next()){
				user=new Users();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("user_name"));
				user.setPwd(rs.getString("pwd"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				Role role=new Role();
				role.setId(rs.getInt("r_id"));
				role.setRole(rs.getString("role_name"));
				user.setRole(role);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return user;
	}

	public PageBean findAll(int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		String sql="select uses.id,user_name,pwd,email,phone,r_id,role_name from uses" +
				" left join role on uses.r_id=role.id order by id desc ";
		ResultSet rs=super.executeQueryForPage(sql,pageNo,pageSize);
		PageBean pageBean=new PageBean();
		List<Users> userList=new ArrayList<Users>();
		Users user=null;
		try {
			while(rs.next()){
				user=new Users();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("user_name"));
				user.setPwd(rs.getString("pwd"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
				Role role=new Role();
				role.setId(rs.getInt("r_id"));
				role.setRole(rs.getString("role_name"));
				user.setRole(role);
				userList.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		pageBean.setData(userList);
		sql="select count(id) from uses order by id desc";
		pageBean.setRecordCount(super.executeTotalCount(sql));
		return pageBean;
	}

	public int update(Users user) {
		String sql="update uses set user_name=? ," +
				" pwd=? where id=?";
		return super.executeUpdate(sql,new Object[]{user.getUserName(),user.getPwd(),user.getId()});
	}
	public int update(int uid, int rid) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int update(Integer uid, Integer rid) {
		// TODO Auto-generated method stub
		String sql="update uses set r_id=? where id=?";
		return super.executeUpdate(sql,new Object[]{rid,uid});
	}
	

}
