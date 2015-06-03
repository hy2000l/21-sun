<%@page import="com.product.entity.Product"%>
<%@page import="com.product.service.impl.ProductServiceImpl"%>
<%@page import="com.product.service.ProductService"%>
<%@ page language="java" import="java.util.*"
 pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'product_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#tools,#list{
		width:600px;
		margin:0px auto;
		
	}
	</style>
  </head>
  
  <body>
  <div id="tools">
  <a href="shoppingcar.jsp">查看购物车</a>
  </div>
  <div id="list">
  	<table>
  	<tr><td>产品名称</td><td>类型</td><td>价格</td><td></td></tr>
  	<%
  		ProductService pservice=new ProductServiceImpl();
  		List<Product> plist=pservice.getProudctList();
  		for(int i=0;i<plist.size();i++){
  			Product p=plist.get(i);
  		%>
  			<tr><td><%=p.getProductName()%></td><td><%=p.getType() %></td><td><%=p.getPrice() %></td>
  			<td><a href="product_desc.jsp?id=<%=p.getId()%>">详情</a></td>
  			</tr>
  		<% 
  		
  		}
  	 %>
  	 </table>
  </div>
   </body>
</html>
