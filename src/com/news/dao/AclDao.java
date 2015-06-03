package com.news.dao;

import java.util.List;

public interface AclDao {
	public int findAcl(int rid,int mid);
	public int findAcl(int rid,String url);
	
	public List<Integer> findModelId(int rid);
	
	public int delete(int rid);
	
	public int batchInsert(int rid,String[] mid);
}
