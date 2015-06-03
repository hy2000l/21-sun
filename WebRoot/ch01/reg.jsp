<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'reg.jsp' starting page</title>
    
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
  <form name="form1" method="post" action="do_reg.jsp">
    <table border="0" align="center">
      <tr><td>用户名</td><td> <input type="text" name="name"></td></tr>
      <tr><td>密码</td><td > <input type="password" name="pwd"> </td></tr>
      <tr><td>性别</td><td >
      <input type="radio" name="sex" value="0"/>男
      <input type="radio" name="sex" value="1"/>女
      
       </td></tr>
        <tr><td>学历：</td><td >
      	<select name="edu">
      		<option value="1">中专</option>
      		<option value="2">大学</option>
      		
      	</select>
      
       </td></tr>
      <tr> <td>你从哪里知道我们</td><td> 
          <input type="checkbox" name="channel" value="报刊">报刊 
          <input type="checkbox" name="channel" value="网络">网络 
          <input type="checkbox" name="channel" value="朋友推荐"> 朋友推荐 
          <input type="checkbox" name="channel" value="电视"> 电视
        </td></tr>
       <!-- 以下是提交、取消按钮 -->
         <tr> <td colspan="2">
         <input type="submit" value="登录"/></td></tr>
    </table>
</form>

  </body>
</html>
