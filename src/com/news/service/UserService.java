package com.news.service;

import com.news.entity.PageBean;
import com.news.entity.Users;

public interface UserService {
	
	public Users login(String uname,String pwd);
	public PageBean getUserList(int pageNo,int pageSize);
	public int updateUser(Users user);
	
	public int addUser(Users user);
	public boolean hasPermission(int rid,int mid);	
	public boolean hasPermission(int rid,String url);
	
	public int setRole(Integer uid,Integer rid);
	
	public int deleteUser(int uid);
	

}
