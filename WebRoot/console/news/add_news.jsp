<%@page import="com.news.util.DateUtil"%>
<%@page import="com.news.entity.NormalNews"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" 
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	NormalNews news=new NormalNews();
	//判断表单是否是Multipart类型的。这里可以直接对request进行判断 
	if(ServletFileUpload.isMultipartContent(request)){
		// 创建文件处理工厂，它用于生成 FileItem 对象。 
		DiskFileItemFactory factory=new DiskFileItemFactory();
		String fileDir=pageContext.getServletContext().getRealPath("/upload_img");
		File uploadDir=new File(fileDir);
		if(!uploadDir.exists()){
			uploadDir.mkdir();
		}
		//设置文件的缓存路径
		String tempdir=pageContext.getServletContext().getRealPath("/upload_img/temp");
		File d=new File(tempdir);
		if(!d.exists()){
			d.mkdir();
		}
		factory.setSizeThreshold(1024*1024);//设置最多只允许在内存中存储的数据,单位:字节
		factory.setRepository(d);// 设置一旦文件大小超过getSizeThreshold()的值时数据存放在硬盘的目录(默认可以不用设置)
		ServletFileUpload upload=new ServletFileUpload(factory);
		// 设置允许用户上传文件大小,单位:字节
		upload.setFileSizeMax(10*1024*1024);
		//上传文件,并解析出所有的表单字段，包括普通字段和文件字段
		List<FileItem> items=upload.parseRequest(request);
		  //下面对每个字段进行处理，分普通字段和文件字段
		 Iterator<FileItem> i= items.iterator();
		 while(i.hasNext()){
		 	FileItem fileItem=i.next();
		 	//如果是普通字段
		 	if(fileItem.isFormField()){
		 		String paramName=fileItem.getFieldName();//得到字段name属性的值
		 		String paramValue=fileItem.getString("utf-8");//得到该字段的值,编码格式utf-8
		 		if(paramName.equals("title")){
		 			news.setTitle(paramValue);
		 		}else if(paramName.equals("channel_id")){
		 			news.setChannelId(Integer.parseInt(paramValue));
		 		}else if(paramName.equals("content")){
		 			news.setContent(paramValue);
		 		}else if(paramName.equals("stime")){
		 			news.setPublishTime(DateUtil.toDate(paramValue));
		 		}
		 	}else{//文件字段
		 		 String fullPath= fileItem.getName(); //得到file字段的文件名全路径名
		 		 //  fileItem.getContentType();//文件类型
      			 // fileItem.getSize());//文件大小
		 		if(fullPath!=null&&fileItem.getSize()!=0){
		 				String ext=fullPath.substring(fullPath.lastIndexOf("."));//获取扩展名
		 				String name="n"+DateUtil.getTime();
		 				fileItem.write(new File(fileDir,name+ext));
		 			
		 				news.setSmallImg(name+ext);
		 		}
		 	}
		 }
		 
		
		
	}
	response.sendRedirect("addNews.html");
 %>
</body>
</html>