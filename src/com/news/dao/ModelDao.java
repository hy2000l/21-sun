package com.news.dao;

import java.util.List;

import com.news.entity.Model;

public interface ModelDao {
	
	public List<Model> findByParentId(int pid);
	
	public List<Model> findByRoleId(int rid);
	
	
}
