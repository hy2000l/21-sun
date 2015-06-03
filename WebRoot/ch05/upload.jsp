<%@page import="com.news.util.ImageUtil"%>
<%@page import="com.news.entity.NormalNews"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'upload.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<%
		NormalNews news=new NormalNews(); 
		DiskFileItemFactory fileItemFactory=new DiskFileItemFactory();
		fileItemFactory.setSizeThreshold(1*1024*1024);//设置内存缓存大小
		String strDir=pageContext.getServletContext().getRealPath("/console/news/upload_img/temp");
		String strUploadDir=application.getRealPath("/console/news/upload_img");
		File uploadDir=new File(strUploadDir);
		if(!uploadDir.exists()){
			uploadDir.mkdir();
		}
		File tempDir=new File(strDir);
		if(!tempDir.exists()){
			tempDir.mkdir();
		}
		fileItemFactory.setRepository(tempDir);//临时目录，存储超出缓存的数据
		ServletFileUpload fileUpload=new ServletFileUpload(fileItemFactory);
		fileUpload.setFileSizeMax(10*1024*1024);
		List<FileItem> fileItemList=fileUpload.parseRequest(request);
		Iterator<FileItem> i=fileItemList.iterator();
		while(i.hasNext()){
			FileItem item=i.next();
			if(item.isFormField()){//判断是否是文件
				String paramName=item.getFieldName();//参数名
				String paramValue=item.getString("utf-8");//参数值
				if(paramName.equals("title")){
					news.setTitle(paramValue);
				}else if(paramName.equals("content")){
					news.setContent(paramValue);
				}
				
			}else{//文件数据
				String fileName=item.getName();//本地文件名称
				long time=new Date().getTime();
				String ext=fileName.substring(fileName.lastIndexOf("."));
				String saveFileName="n"+time+ext;
				String smallFileName="n"+time+"s"+ext;
				item.write(new File(uploadDir,saveFileName));
				ImageUtil.zoomImgAndSave(new File(uploadDir,saveFileName), 
					60, 60,new File(uploadDir,smallFileName));
				news.setSmallImg(saveFileName);
				
			}
		}
		System.out.println(news.getTitle());
		System.out.println(news.getContent());
		
		System.out.println(news.getSmallImg());
		
	 %>
	 
  </body>
</html>
