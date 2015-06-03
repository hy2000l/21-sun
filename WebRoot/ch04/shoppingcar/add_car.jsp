<%@page import="com.product.entity.CarItem"%>
<%@page import="com.product.entity.Product"%>
<%@page import="com.product.service.impl.ProductServiceImpl"%>
<%@page import="com.product.service.ProductService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'add_car.jsp' starting page</title>
    
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
    	String id=request.getParameter("id");
    	ProductService pservice=new ProductServiceImpl();
    	//组织购物项
    	Product product=pservice.getProductDesc(Integer.parseInt(id));
    	CarItem item=new CarItem();
    	item.setProduct(product);
    	item.setAmount(1);
    	//从Session取得购物车(list)
    	List<CarItem> car=(List)session.getAttribute("car");
    	if(car==null){
    		car=new ArrayList<CarItem>();
    		session.setAttribute("car", car);
    	}
    	//购物车数量管理
    	//判断购物车中是否存在购物项
    	//如果存在改变数量，否则添加新购物项
    	CarItem fromCar=null;
    	for(int i=0;i<car.size();i++){
			CarItem oldItem=car.get(i);
			if(oldItem.getProduct().getId()==item.getProduct().getId()){
				fromCar=oldItem;
				break;	
			}
    	}
    	if(fromCar!=null){//在购物车中存在
    		fromCar.setAmount(fromCar.getAmount()+item.getAmount());
    	}else{//不存在
    		car.add(item);
    	}
    	//重定向到详细页面，重传Id数据
    	response.sendRedirect("product_desc.jsp?id="+id);
    	
     %>
  </body>
</html>
