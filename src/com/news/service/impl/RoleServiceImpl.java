package com.news.service.impl;

import java.util.List;

import com.news.dao.AclDao;
import com.news.dao.ModelDao;
import com.news.dao.RoleDao;
import com.news.dao.impl.AclDaoImpl;
import com.news.dao.impl.ModelDaoImpl;
import com.news.dao.impl.RoleDaoImpl;
import com.news.entity.Model;
import com.news.entity.PageBean;
import com.news.entity.Role;
import com.news.service.RoleService;

public class RoleServiceImpl implements RoleService {
	private RoleDao roleDao=new RoleDaoImpl();
	private ModelDao modelDao=new ModelDaoImpl(); 
	private AclDao aclDao=new AclDaoImpl();
	public PageBean searchRole(int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		return roleDao.find(pageNo, pageSize);
	}

	public int addRole(Role role) {
		// TODO Auto-generated method stub
		return roleDao.insert(role);
	}

	public int deleteRole(int rid) {
		// TODO Auto-generated method stub
	
		return roleDao.deleteByProc(rid);
		
	}

	public List<Integer> getRoleResource(int rid) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Model> getRoleAcl(int rid) {
		// TODO Auto-generated method stub
		return modelDao.findByRoleId(rid);
	}

	public int modifyAcl(int rid, String[] mid) {
		// TODO Auto-generated method stub
		int ret=0;
		ret=aclDao.delete(rid);
		ret+=aclDao.batchInsert(rid, mid);
		return ret;
	}

	public List<Role> searchRole() {
		// TODO Auto-generated method stub
		return roleDao.find();
	}

}
