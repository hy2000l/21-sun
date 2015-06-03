package com.product.service;

import java.util.List;

import com.product.entity.Product;

public interface ProductService {
	public List<Product> getProudctList();
	public Product getProductDesc(int id);
}
