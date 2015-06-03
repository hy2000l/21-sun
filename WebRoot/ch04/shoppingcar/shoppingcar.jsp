<%@page import="com.product.entity.CarItem"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'shoppingcar.jsp' starting page</title>
    
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
  <ul>
  <%
  	double sum=0;
  	List<CarItem> car=(List<CarItem>)session.getAttribute("car");
  	if(car==null||car.size()==0){
  		%>
  			<li>没有购物项</li>
  		<% 
  	}else{
  		for(int i=0;i<car.size();i++){
  			CarItem item=car.get(i);
  			double price=item.getProduct().getPrice();
  			double total=item.getAmount()*price;
  			sum+=total;
  			%>
  		<li><%=item.getProduct().getProductName() %>&nbsp;&nbsp;&nbsp;
  			<%=item.getProduct().getType() %>&nbsp;&nbsp;&nbsp;
  			<%=price %>&nbsp;&nbsp;&nbsp;
  			<span><%=item.getAmount()%></span>&nbsp;&nbsp;&nbsp;
  			<span><%=total%></span>
  			&nbsp;&nbsp;&nbsp;
  			<a href="javascript:updateAmount(this)">修改</a>
  			<a href="del_car.jsp?id=<%=item.getProduct().getId()%>">
  			删除</a>
  		</li>
  			<% 
  		}
  	}
   %>
   </ul>
   <div>
   	总价格：<span id="money"><%=sum %></span>
   </div>
  </body>
</html>
