<%@page pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="js/jquery.easyui.min.js" type="text/javascript"></script>
<link href="themes/default/easyui.css" rel="stylesheet"  type="text/css"></link>
<link href="themes/icon.css"  rel="stylesheet"  type="text/css"/>
<link href="css/head.css"  rel="stylesheet"  type="text/css"/>
<style>
ul,li{margin:0px; padding:0px}
#nav li{
	list-style:none;
	height:30px;
	margin:0px 2px;
	font-size:12px;
	line-height:30px; 
	border-bottom:#eee 1px solid;
	
}
li a{
	padding:0px 14px;
	text-decoration:none;
	color:#333;
	
}
li a:hover{
	display:block;
	height:100%;
	background-color:#FFC;
	}
	
</style>
<script>
function addTabs(title,url){
 if($('#tt').tabs('exists',title)){
		$('#tt').tabs('select',title);
}else{
	var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';   
	$('#tt').tabs('add',{
		title:title,
		closable:true,
		content:content
		})
	}
}
</script>
</head>

<body  class="easyui-layout" >

<div data-options="region:'north'" style="height:50px" >
<iframe src="common/head.html" frameborder="0" scrolling="no" width="100%" height="100%"></iframe>
</div>
<div data-options="region:'west',title:'导航',split:true" style="width:150px;" >
	<div id="nav"  class="easyui-accordion"   data-options="fit:true,selected:0">
    	<div title="新闻信息管理" data-options="iconCls:'icon-cus-database_gear'">
        	<ul >
        	 <li><a href="javascript:addTabs('信息发布','news/addNews.html')">发布信息</a></li>
             <li><a href="javascript:addTabs('视频信息发布','news/addNews2.html')">视频发布信息</a>
             <li><a href="javascript:addTabs('信息管理','news/news_list2.html')">信息管理</a></li>
            </ul>
        </div>
    	
        <div title="消息推送" data-options="iconCls:'icon-cus-database_gear'">
        	<ul >
           <li><a href="#"  onclick="addTabs('消息推送','push/push.html')">消息推送</a></li>    <li><a href="#" onclick="addTabs('消息管理','')">消息管理</a></li>
            	<li><a href="#" onclick="addTabs('数据分析','')">数据分析</a></li>     
            </ul>
        </div>

        <div title="调查问卷管理" data-options="iconCls:'icon-cus-page_edit'"  >
        	<ul >
            	<li><a href="#" onclick="addTabs('问卷信息','vote/ThemeServlet')">问卷管理</a></li>
                <li><a href="#" onclick="addTabs('添加问卷','vote/manager/add_theme.jsp')">添加问卷</a></li>
                <li><a href="#" onclick="addTabs('组织问卷','vote/ThemeServlet?method=1')">组织问卷</a></li>
            </ul>
        </div>
        <div title="信息分析统计" data-options="iconCls:'icon-cus-char'">
        	<ul >
            	<li><a href="#">票数分析</a></li>
                <li><a href="#">问卷分析</a></li>
                
            </ul>
        </div>
            <div title="字典管理" data-options="iconCls:'icon-cus-database_gear'">
        <ul >
        	<li><a href="javascript:addTabs('频道管理','news/type.html')">频道管理</a></li>
            </ul>
        </div>
        <div title="账号管理">
        <ul >
         		
            <li><a href="#" onclick="addTabs('账户管理','user/users.html')" >账号管理</a></li>
            </ul>
        </div>
      
    </div>

</div>	
<div data-options="region:'center',split:true,iconCls:'icon-reload'">
	<div  id="tt" class="easyui-tabs"  data-options="fit:true">
         <div title="主页" style="padding:10px">
         <iframe scrolling="auto" frameborder="0"  src="home.html" style="width:100%;height:100%;"></iframe>
         </div>   
    </div>
</div>
<div data-options="region:'south',title:'底部区域'" style="height:60px"></div>
</body>
</html>
