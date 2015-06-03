package com.news.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class ImageUtil {
	
	public static int zoomImgAndSave(File file,int w,int h,File saveFile){
		int ret=0;
		try {
			String ext=file.getName().substring(file.getName().lastIndexOf(".")+1);
			BufferedImage srcImg=ImageIO.read(file);//��ȡԭͼ��Ϣ
			Image targetImg=srcImg.getScaledInstance(w,h, Image.SCALE_SMOOTH);//���ߴ�����ͼƬ
			BufferedImage bufferedImage=new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
			bufferedImage.getGraphics().drawImage(targetImg, 0, 0, null);//��targetImg���Ƶ�bufferedImage��
			ImageIO.write(bufferedImage, ext , saveFile);//����ͼƬ
			ret=1;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
		
	}
	/**
	 * �ȱ�������ͼƬ
	 * @param file
	 * @param w
	 * @param h
	 * @param saveFile
	 * @return
	 */
	public static int zoomScaleImgAndSave(File file,
			int w,int h,File saveFile){
		int ret=0;
		double rate1=0.0,rate2=0.0;
		try {
			String ext=file.getName().substring(file.getName().lastIndexOf(".")+1);
			BufferedImage srcImg=ImageIO.read(file);//��ȡԭͼ��Ϣ
			if(srcImg.getWidth()>w||srcImg.getHeight()>h){//�ȱ�����
				rate1=srcImg.getWidth()/w;
				rate2=srcImg.getHeight()/h;
				double rate=rate1>rate2?rate1:rate2;
				w=(int)(srcImg.getWidth()/rate);
				h=(int)(srcImg.getHeight()/rate);
			}
			Image targetImg=srcImg.getScaledInstance(w,h, Image.SCALE_SMOOTH);
			BufferedImage bufferedImage=new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB);
			bufferedImage.getGraphics().drawImage(targetImg, 0, 0, null);//��targetImg���Ƶ�bufferedImage��
			ImageIO.write(bufferedImage, ext , saveFile);//����ͼƬ
			ret=1;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;
		
	}
}
