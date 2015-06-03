package com.news.service.impl;

import java.util.List;

import com.news.dao.ModelDao;
import com.news.dao.impl.ModelDaoImpl;
import com.news.entity.Model;
import com.news.service.ModelService;

public class ModelServiceImpl implements ModelService {

	private ModelDao modelDao=new ModelDaoImpl();
	/**
	 * 
	 */
	public List<Model> getMenu() {
		// TODO Auto-generated method stub
		List<Model> modelList=modelDao.findByParentId(0);
		for(Model m:modelList){
			List<Model> childModel=modelDao.findByParentId(m.getId());
			m.setChildModel(childModel);
		}
		return modelList;
	}

}
