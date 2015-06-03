package com.news.entity;

public class ImagePart {
	
	private int id;
	private int newsId;
	private String imgUrl;
	private String imgTilte;
	private String imgDesc;
	private int imgOrder;
	
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getImgTilte() {
		return imgTilte;
	}
	public void setImgTilte(String imgTilte) {
		this.imgTilte = imgTilte;
	}
	public String getImgDesc() {
		return imgDesc;
	}
	public void setImgDesc(String imgDesc) {
		this.imgDesc = imgDesc;
	}
	public int getImgOrder() {
		return imgOrder;
	}
	public void setImgOrder(int imgOrder) {
		this.imgOrder = imgOrder;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	
	
	
}
