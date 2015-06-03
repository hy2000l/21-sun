package com.product.service.impl;

import java.util.List;

import com.product.dao.ProductDao;
import com.product.dao.impl.ProductDaoImpl;
import com.product.entity.Product;
import com.product.service.ProductService;

public class ProductServiceImpl implements ProductService {
	private ProductDao productDao=new ProductDaoImpl();
	public List<Product> getProudctList() {
		// TODO Auto-generated method stub
		return productDao.findAll();
	}

	public Product getProductDesc(int id) {
		// TODO Auto-generated method stub
		return productDao.findByID(id);
	}

}
