package com.news.entity;

import java.util.ArrayList;
import java.util.List;

public class Model {
	private int id;
	private String name;
	private String url;
	private int order;
	private int level;
	private List<Model> childModel=new ArrayList<Model>();
	
	private int check;//表示选择状态 1 选择  0 不选择
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public List<Model> getChildModel() {
		return childModel;
	}
	public void setChildModel(List<Model> childModel) {
		this.childModel = childModel;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
	
	
	
}
