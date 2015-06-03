package com.product.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import com.news.dao.BaseDao;
import com.product.dao.ProductDao;
import com.product.entity.Product;

public class ProductDaoImpl extends BaseDao implements ProductDao {
	
	public List<Product> findAll() {
		// TODO Auto-generated method stub
		String sql="select * from product order by id desc";
		ResultSet rs=super.executeQuery(sql);
		Product p=null;
		List<Product> productList=new ArrayList<Product>();
		try {
			while(rs.next()){
				p=new Product();
				p.setId(rs.getInt("id"));
				p.setProductName(rs.getString("product_name"));
				p.setPrice(rs.getDouble("product_price"));
				p.setType(rs.getString("product_type"));
				productList.add(p);
				
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return productList;
	}

	public Product findByID(int id) {
		// TODO Auto-generated method stub
		String sql="select * from product where id=?";
		ResultSet rs=super.executeQuery(sql,id);
		Product p=null;
		
		try {
			if(rs.next()){
				p=new Product();
				p.setId(rs.getInt("id"));
				p.setProductName(rs.getString("product_name"));
				p.setPrice(rs.getDouble("product_price"));
				p.setType(rs.getString("product_type"));
				p.setDesc(rs.getString("product_desc"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			super.closeAll();
		}
		return p;
	}

}
