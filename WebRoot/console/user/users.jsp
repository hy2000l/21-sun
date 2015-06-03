<%@page import="com.news.entity.PageBean"%>
<%@page import="com.news.entity.Users"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	$("#roleListDig").dialog("close");
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
$("#sys_user_list").datagrid({
		title:'账号列表',
		fit:true,
		fitColumns:true,
		idField:'id',
		singleSelect:true,
		pagination:true,
		//data:[{'id':1,'uname':'admin'},{'id':2,'uname':'user01'}],
		toolbar:"#stu_tb",
		columns:[[
		{field:'id',title:'编号',width:10},
		{field:'uname',title:'名称',width:10},
		{field:'roleName',title:'角色',width:10},
		{field:'opt',title:'操作',width:20,formatter:function(val,row,idx){	
			var content="<input type='button' value='修改密码' onclick=\"setpwd("+idx+")\"/>";
			content+="<input type='button' value='分配角色' "+
			"onclick=\"setRole("+row.id+",'"+row.roleName+"')\"/>";
				content+="<input type='button' value='删除账号' onclick=\"del('1')\"/>";
			return content;
		}}]]
});

var paginationobj=$("#sys_user_list").datagrid("getPager");
	paginationobj.pagination({
		pageNumber:parseInt('${pb.pageNo}'),
		pageSize:parseInt('${pb.pageSize}'),
		total:parseInt('${pb.recordCount}'),
		pageList:[2,5,10],//设置分页尺寸下列列表中的数据
		onSelectPage:function(pageNumber, pageSize){
			window.location.href="user/SearchUserServlet?pageNo="+pageNumber+"&pageSize="+pageSize;
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
			alert(ids);
			$("#idsel").val(ids);
			$("#delFrm").submit();
		}
	});
	
});
});
function setpwd(idx){
	var row=$("#sys_user_list").datagrid("getRows")[idx];
	$("input[name='userName']").val(row.uname);
	$("input[name='id']").val(row.id);
	showDialog("修改账号");
}

function setRole(uid,roleName){
	$("input[name='uid']").val(uid);
	$.ajax({url:'/21-sun/role/GetRolesJosnServlet',
	async:false,
	dataType:'json',
	error:function(){},
	success:function(data){
		$("table[name='roleTable']").html("");
		for(var i=0;i<data.length;i++){
			var trobj=$("<tr>").appendTo("table[name='roleTable']");
			var tdobj=$("<td>").appendTo(trobj);
			var inputobj=$("<input type='radio' name='role' >")
				.appendTo(tdobj).val(data[i].id);
			tdobj.append(data[i].role);
			if(data[i].role==roleName){
				inputobj.attr("checked","checked");
			}
		}
	}});
	showRoleDialog();
	
}
function getRowIndex(target){
	var tr=$(target).closest("tr.datagrid-row");	
	return parseInt(tr.attr('datagrid-row-index'));
}
	function changeMajor(majorid,classid){
		var majorVal=$(majorid).val();
		var options="<option value='0'>--请选择--</option>";
		if(majorVal=='0'){
			$(classid).html(options);return ;
		}
		var idx=$(majorid).get(0).selectedIndex;
		var txt=$(majorid).get(0).options[idx].text;
		$.ajax({
			url:'SearchClassServlet?mid='+majorVal,
			success:function(classArr){
				
				for(var i=0;i<classArr.length;i++){
					options+="<option value="+classArr[i].id+">"+
					classArr[i].className+"</option>";
				}
				$(classid).html(options);
			}
		});
		
	}
function showRoleDialog(){
	$("#roleListDig").dialog({
		title:'请选择角色',
		width:600,
		height:400,
	modal:true,
		closed:true,
		buttons:[{
			text:'确定',
			handler:function(){
				setRoleFrm.submit();
				$("#roleListDig").dialog("close");
			}
		},{
		text:'取消',
			handler:function(){
				$("#roleListDig").dialog("close");
			}
		
		}]
		});
		$("#roleListDig").dialog("open");	
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
	showDialog('添加账号');
	$("input[name='opt']").val("1");//opt=1表示添加；opt=2表示修改
	//$("#myFrm").attr("action","AddUserServlet");
	
}	
function del(nid){
	if(nid=="1"){
		$.messager.alert("提示信息","该账号不能被删除");
		return;
	}
	$.messager.confirm("删除提醒","确认删除吗？",function(r){
		if(r){
				window.location.href="SysUserManageServlet?opt=4&id="+nid;
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

<table id="sys_user_list" >
	<c:forEach items="${pb.data }" var="user">
		<tr  >
		<td>${user.id }</td>
		<td>${user.userName }</td>
		<td>${user.role.role }</td>
		<td>
		
		</td>	
		</tr>
</c:forEach>
	
</table>

<div id="stu_tb"  style="padding:3px">

<a href="#" id="addUser" onclick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加账号</a>

</div>


 <div id="mydg"  style="padding:10px" class="easyui-dialog" >
      <table >
 <form id="myFrm" action="/21-sun/user/UserServlet" method="post" >
 	<input type="hidden" name="id" /> 
 	<input type="hidden" name="opt"/>
    <tr>
      <td>姓名：</td>
      <td><input type="text" name="userName" /></td>
    </tr>
     <tr>
      <td>密码：</td>
      <td><input type="text" name="pwd" /></td>
    </tr>
    <tr>
      <td><input type="button" value="确定" onclick="subFrm()"/></td>
      <td><input type="reset" name="重置"/></td>
    </tr>
    </form>
    </table>
   </div> 




<div id="roleListDig"  style="padding:10px" class="easyui-dialog" >
	<form action="user/SetRoleServlet" name="setRoleFrm">
		<input type="hidden" name="uid"/>
		<table name="roleTable">
	
			
		</table>
	</form>	
</div>
</body>
</html>