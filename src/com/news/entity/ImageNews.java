package com.news.entity;

import java.util.List;

public class ImageNews extends BaseNews {
	
	private List<ImagePart>  imageList;

	public List<ImagePart> getImageList() {
		return imageList;
	}

	public void setImageList(List<ImagePart> imageList) {
		this.imageList = imageList;
	}
	
	
}
