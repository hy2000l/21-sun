package com.news.dao;

import java.util.List;

import com.news.entity.PageBean;
import com.news.entity.Role;

public interface RoleDao {
	
	public PageBean find(int pageNo,int pageSize);
	
	public int insert(Role role);
	
	public int delete(int rid);
	
	public int deleteByProc(int rid);
	
	public List<Role> find();
	
	
	
	
}	
