<%@page import="com.news.entity.BaseNews"%>
<%@page import="java.util.List"%>
<%@page import="com.news.entity.PageBean"%>
<%@page pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/base_path.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<link href="console/themes/default/easyui.css" rel="stylesheet"  type="text/css"/>
<link href="console/themes/icon.css" rel="stylesheet"  type="text/css"/>
<script type="text/javascript" src="console/js/jquery-1.7.2.min.js"></script>
<script src="console/js/jquery.easyui.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
$("input.easyui-datebox").datebox({
   		 formatter: function(date){
		   	var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+"-"+m+"-"+d;
   		 },
   		 parse:function(date){
   		 	 var t=Date.parse(date);
			if (!isNaN(t)){
				return new Date(t);
			} else {
				return new Date();
			}
   		 }
	});
$("#school_news_list").datagrid({
		title:'信息列表',
		fit:true,
		fitColumns:true,
		idField:'id',
		singleSelect:false,
		pagination:true,
		pageList:[3,5,10,20],
		toolbar:"#news_tb",
		columns:[[
		{field:'id',checkbox:true},
		{field:'title',title:'标题',width:100},
		{field:'author',title:'添加者',width:100},
		{field:'time',title:'创建日期',width:60},{field:'type',title:'信息类型',width:50},
		{field:'opt',title:'操作',width:50}]]
});
$("#school_news_list").datagrid("getPager").pagination({
    pageNumber:${pageBean.pageNo},
    pageSize:${pageBean.pageSize},
    total:${pageBean.recordCount},
    onSelectPage:function(pageNumber,pageSize){
    	window.location.href='news/SearchBaseNewsServlet?pageNo='+pageNumber+'&pageSize='+pageSize;
    }
});

$("#delsel").click(function(){
	var selRows=$("#school_news_list").datagrid("getSelections");
	if(selRows.length==0){
		$.messager.alert('消息框',"请选择一条记录");
		return;
	}
	$.messager.confirm("批量删除提醒","确认要执行删除操作吗",function(r){
		if(r){
			var ids="";
			for(var i=0;i<selRows.length;i++){
				if(i!=selRows.length-1)ids+=selRows[i].id+",";
				else ids+=selRows[i].id;
			}
			$("#idsel").val(ids);
			$("#delFrm").submit();
		}
	});
	
});
});
function delRow(nid){
	$.messager.confirm("删除提醒","确认要执行删除操作吗?",function(r){
		if(r){
			window.location.href="news/DeleteNewsServlet?nid="+nid;
		}
	});
	
}
function showNews(nid){
	$("#school_news_list").datagrid("clearChecked");
	parent.addTabs("新闻预览","news/show_news.html");
	
}
function showComment(nid){
	var url="news/news_comment_list.html?nid="+nid;
	parent.addTabs('评论列表',url);
}
function getRowIndex(target){
	var tr=$(target).closest("tr.datagrid-row");	
	return parseInt(tr.attr('datagrid-row-index'));
}

</script>
</head>
<body>

<table id="school_news_list" >
<c:if test="${!empty pageBean.data }">
	<c:forEach items="${pageBean.data}" var="news">
		<tr>
		<td>${news.id}</td>
		<td>${news.title }</td>
		<td>${news.source }</td>
		<td>${news.publishTime }</td>
		<td>${news.channelId }</td>
		<td><input type='button' value='删除' 
		onclick='delRow(${news.id})'/>
			<input type='button' value='预览' onclick='showNews(68)'/>
		<input type='button' value='管理评论' onclick='showComment(68)'/>
		</td>
		</tr>
	</c:forEach>
</c:if>
</table>
<div id="news_tb"  style="padding:3px">
<form action="SearchSchoolNewsServlet" method="post" name="searchForm" >
<a href="#" id="delsel" class="easyui-linkbutton" data-options="iconCls:'icon-search'">批量删除</a>
<input type="hidden" value="1" name="status"/>

<span>标题：</span><input type="text"  class="txt" name="title"/>
<span>类型：</span>
<!-- 
<input  class="easyui-combobox"
data-options="valueField:'id',textField:'serviceType',
url:'../service_type/get_service_type_json.jsp'"
name="typeId"/>
 --> 
 	<select name="pagetag">
 	  <option value='0'>--请选择--</option>        		
	        	<option value="11">原创</option>	        	
	        	<option value="12">人物</option>
	        	<option value="13">趋势</option>
	        	<option value="14">行业</option>
     </select>
<a href="#" onclick="searchForm.submit();"
class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
</form>
</div>
<form action="DeleteSelectNewsServlet" method="post" id="delFrm">
	<input type="hidden" name="ids" value="" id="idsel"/>
</form>
</body>
</html>