<%@ page pageEncoding="utf-8" %>
<jsp:include page="/common/base_path.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script src="console/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="console/js/jquery.easyui.min.js" type="text/javascript"></script>
<link href="console/themes/default/easyui.css" rel="stylesheet"  type="text/css"></link>
<link href="console/themes/icon.css"  rel="stylesheet"  type="text/css"/>
<link href="console/css/head.css"  rel="stylesheet"  type="text/css"/>
<script>
$(function(){
	$("#login").dialog({
		title:'新闻管理系统',iconCls:'icon-cus-lock',
		width: 420,
    	height: 230,
		minimizable:false,
		maximizable:false,
		collapsible:false,
		resizable:false,
		modal: true,
		buttons:[{
				text:'登录',
				handler:function(){
					doLogin();
				}
			}]
		
	});
})
function doLogin(){
		$("#login").dialog("close");
		$("#loginForm").get(0).submit();
}
</script>
</head>

<body>
<div id="login"  style="padding-top:10px">
<div class="easyui_panel" data-options="noheader:true,fit:true" style="padding-left:12px"> 
	<form action="user/LoginServlet"   target="_self" id="loginForm" method="post">
    	<table>
        <tr><td>
    	<table>
        	<tr><td>用户名：</td><td><input type="text"  id="uname" name="uname"/></td><td></td></tr>
            <tr><td>密码：</td><td><input type="password"  id="upwd" name="pwd"/></td><td></td></tr>
        </table>
        </td>
        <td>
        	<img src="console/images/head.png"/>
        </td>
        </tr>
        </table>
    </form>
</div>
</div>
</body>
</html>
