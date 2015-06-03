<%@page import="com.news.entity.PageBean"%>
<%@page import="com.news.entity.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.news.service.UserService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="utf-8" %>
<jsp:include page="/common/base_path.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="console/themes/default/easyui.css" rel="stylesheet"  type="text/css"/>
<link href="console/themes/icon.css" rel="stylesheet"  type="text/css"/>
<script type="text/javascript" src="console/js/jquery-1.7.2.min.js"></script>
<script src="console/js/jquery.easyui.min.js" type="text/javascript"></script>
<script type="text/javascript">


$(function(){
	$("#mydg").dialog("close");
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
$("#sys_role_list").datagrid({
		title:'角色列表',
		fit:true,
		fitColumns:true,
		idField:'id',
		singleSelect:true,
		pagination:true,
		//data:[{'id':1,'uname':'admin'},{'id':2,'uname':'user01'}],
		toolbar:"#role_tb",
		columns:[[
		{field:'id',title:'编号',width:10},
		{field:'roleName',title:'名称',width:10},
		{field:'opt',title:'操作',width:20,formatter:function(val,row,idx){
			var content="<input type='button' value='删除角色' onclick=\"del('"+row.id+"')\"/>";
			content+="<input type='button' value='分配权限' onclick=\"setPermission("+row.id+")\"/>";
				
			return content;
		}}]]
});

var paginationobj=$("#sys_role_list").datagrid("getPager");
	paginationobj.pagination({
		pageNumber:parseInt('${pb.pageNo}'),
		pageSize:parseInt('${pb.pageSize}'),
		total:parseInt('${pb.recordCount}'),
		pageList:[5,10],//设置分页尺寸下列列表中的数据
		onSelectPage:function(pageNumber, pageSize){
			window.location.href="role/SearchRoleServlet?pageNo="+pageNumber+"&pageSize="+pageSize;
		}
	
	});


$("#delsel").click(function(){
	var selRows=$("#sys_role_list").datagrid("getSelections");
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
			alert(ids);
			$("#idsel").val(ids);
			$("#delFrm").submit();
		}
	});
	
});
});


function getRowIndex(target){
	var tr=$(target).closest("tr.datagrid-row");	
	return parseInt(tr.attr('datagrid-row-index'));
}

function setPermission(rid){
	parent.addTabs("分配权限","/21-sun/role/ShowAclServlet?rid="+rid);
}


function showDialog(stitle){
	$("#mydg").dialog({
		title:stitle,
		width:600,
		heigth:400,
		modal:true,
		closed:true	
		});
		$("#mydg").dialog("open");	
	}	
function add(){
	showDialog('添加角色');
	$("input[name='opt']").val("1");//opt=1表示添加；opt=2表示修改
	//$("#myFrm").attr("action","AddUserServlet");
	
}	
function del(nid){
	if(nid=="2"){
		$.messager.alert("提示信息","该角色不能被删除");
		return;
	}
	$.messager.confirm("删除提醒","确认删除吗？",function(r){
		if(r){
				window.location.href="role/DelRoleServlet?id="+nid;
		}
			
	});
	
}
function subFrm(){
		myFrm.submit();
		$("#mydg").dialog("close");	
}	
</script>
</head>
<body>

<table id="sys_role_list" >
	<c:forEach items="${pb.data}" var="role">
		<tr  >
		<td>${role.id}</td>
		<td>${role.role }</td>
		<td>
		
	
		
		</td>	
		</tr>
	</c:forEach>
	
</table>

<div id="role_tb"  style="padding:3px">

<a href="#" id="addUser" onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加账号</a>

</div>


 <div id="mydg"  style="padding:10px" class="easyui-dialog" >
      <table >
 <form id="myFrm" action="role/AddRoleServlet" method="post" >
 	<input type="hidden" name="id" /> 
 	<input type="hidden" name="opt"/>
    <tr>
      <td>名称：</td>
      <td><input type="text" name="roleName" /></td>
    </tr>
    <tr>
      <td><input type="button" value="确定" onclick="subFrm()"/></td>
      <td><input type="reset" name="重置"/></td>
    </tr>
    </form>
    </table>
   </div> 





</body>
</html>