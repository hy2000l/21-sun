package com.news.service.impl;

import com.news.dao.AclDao;
import com.news.dao.UserDao;
import com.news.dao.impl.AclDaoImpl;
import com.news.dao.impl.UserDaoImpl;
import com.news.entity.PageBean;
import com.news.entity.Users;
import com.news.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDao userDao=new UserDaoImpl();
	private AclDao aclDao=new AclDaoImpl();
	public Users login(String uname, String pwd) {
		// TODO Auto-generated method stub
		Users u=userDao.findByName(uname);
		if(u!=null&&u.getPwd().equals(pwd)){
			return u;
		}else{
			return null;
			
		}
		
	}
	public PageBean getUserList(int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		return userDao.findAll(pageNo,pageSize);
	}
	public int updateUser(Users user) {
		// TODO Auto-generated method stub
		return userDao.update(user);
	}
	public int addUser(Users user) {
		// TODO Auto-generated method stub
		return userDao.insert(user);
	}
	public boolean hasPermission(int rid, int mid) {
		// TODO Auto-generated method stub
		return aclDao.findAcl(rid, mid)==1?true:false;
		
	}
	public boolean hasPermission(int rid, String url) {
		// TODO Auto-generated method stub
		
		return aclDao.findAcl(rid, url)==1?true:false;
	}
	public int setRole(Integer uid, Integer rid) {
		// TODO Auto-generated method stub
		return userDao.update(uid, rid);
	}
	public int deleteUser(int uid) {
		// TODO Auto-generated method stub
		return userDao.delete(uid);
	}

}
