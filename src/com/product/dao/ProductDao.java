package com.product.dao;

import java.util.List;

import com.product.entity.Product;

public interface ProductDao {
	public List<Product> findAll();
	
	public Product findByID(int id);
}
