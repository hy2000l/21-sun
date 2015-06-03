package com.news.service;

import java.util.List;

import com.news.entity.Model;
import com.news.entity.PageBean;
import com.news.entity.Role;

public interface RoleService {
	
	public PageBean searchRole(int pageNo,int pageSize);
	
	public List<Role> searchRole();
	
	
	public int addRole(Role role);
	
	/**
	 * 删除角色，并将所属用户的r_id改为null
	 * @param rid
	 * @return
	 */
	public int deleteRole(int rid);
	
	public List<Model> getRoleAcl(int rid);
	
	public int modifyAcl(int rid,String[] mid);
	
	public List<Integer> getRoleResource(int rid);
	
	
}
