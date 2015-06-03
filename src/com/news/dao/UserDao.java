package com.news.dao;

import com.news.entity.PageBean;
import com.news.entity.Users;

public interface UserDao {
	public Users findByName(String uname);
	public PageBean findAll(int pageNo,int pageSize);
	public int update(Users user);
	
	public int insert(Users user);
	
	public int update(Integer uid,Integer rid);
	public int delete(int uid);
	
	
	
	
}
