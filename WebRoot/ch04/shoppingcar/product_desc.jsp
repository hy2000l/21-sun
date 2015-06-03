<%@page import="com.product.entity.Product"%>
<%@page import="com.product.service.impl.ProductServiceImpl"%>
<%@page import="com.product.service.ProductService"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'product_desc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#tools,#desc{
		width:600px;
		margin:0px auto;
	}
	ul,li{
		list-style:none;
		margin:0px;
		padding:0px;	
	}	
	</style>
  </head>
  
  <body>
  <%
  	String id=request.getParameter("id");
  	ProductService pservice=new ProductServiceImpl();
  	Product p=pservice.getProductDesc(Integer.parseInt(id));
   %>
   <div id="tools">
   <a href="product_list.jsp">返回产品列表</a>
   <a href="shoppingcar.jsp">查看购物车</a>
   <br/>
    <br/>
   </div>
  <div id="desc">
  <ul>
  	<li>产品名称：<%=p.getProductName() %></li>
  	<li>产品类型：<%=p.getType() %></li>
  	<li>产品价格：<%=p.getPrice() %></li>
  	<li>产品详情：</li>
  	<li><%=p.getDesc() %></li>
  </ul>
   <br/>
   <a href="add_car.jsp?id=<%=id%>">加入购物车</a>
   </div>
  </body>
</html>
