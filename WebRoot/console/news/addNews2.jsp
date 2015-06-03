<%@page pageEncoding="utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="../themes/default/easyui.css" rel="stylesheet"  type="text/css"/>
	<link href="../themes/icon.css" rel="stylesheet"  type="text/css"/>
<style type="text/css">
	td{font-size:12px}
</style>
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
<script src="../js/jquery.easyui.min.js" type="text/javascript"></script>
<script src="kindeditor/kindeditor-min.js" type="text/javascript"></script>
<script src="kindeditor/lang/zh_CN.js" type="text/javascript"></script>
<script>
 var keditor;
$(function(){
$.ajax({url:'/21-sun/news/GetChannelsServlet',
success:function(data){
	
	for(var i=0;i<data.length;i++){
		$("<option>").appendTo("select[name='channel']")
		.html(data[i].channel).val(data[i].id);
	}
},dataType:'json'});



KindEditor.ready(function(k){
	  keditor=k.create('#news_content',{
	 	uploadJson:'kindeditor/jsp/upload_json.jsp',
	 	fileManagerJson:'kindeditor/jsp/file_manager_json.jsp',
	 	allowFileManager:true,
	 	afterUpload:function(url,data){
	 		
	 		$("<input type='hidden' name='imgUrl'>").appendTo("#myFrm").val(url);
	 		$("<input type='hidden' name='simgUrl'>").appendTo("#myFrm").val(data.surl);
	 	}
	 });
	
});
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
	$("input.easyui-datebox").datebox('setValue', getCurDate());
});
function getCurDate(){
		var date=new Date();
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+"-"+m+"-"+d;
}
function subFrm(){
	var stime=$("input.easyui-datebox").datebox("getValue");
	
	$("input[name='stime']").val(stime);
	$("input[name='content']").val(keditor.html());
	$("#myFrm").submit();
}
function showServiceDialog(){
	$("#mydg").dialog({
		title:'添加校园信息',
		width:600,
		heigth:400,
		modal:true,
		closed:true,
		buttons:[{
				text:'提交',
				handler:function(){
				$("#mydg").dialog("close");	
			//	$("input[name='createTime']").val($("#dd1").datebox("getValue"));
				updateForm.submit();
				
				}
			},{
				text:'关闭',
				handler:function(){
					$("#mydg").dialog("close");
				
				}
			}]		
		})
		$("#mydg").dialog("open");	
	}
	
</script>	
</head>
  
  <body>
  <div id="mydg"  style="padding:10px" class="easyui-window" 
  data-options="title:' ',maximized:true,maximizable:false,minimizable:false,closable:false">
      <table >
 <form id="myFrm" action="/21-sun/news/AddNewsServlet"  method="post"  >
 	
    <tr>
      <td>标题：</td>
      <td><input id="tl" type="text" name="title" size="50"/></td>
    </tr>
	  <tr>
	      <td>频道：</td>
	      <td>
	       <select name="channel">
	        
	        	
	        </select>
	      </td>
	    </tr>
        <tr>
        	<td>来自：</td>
            <td>
            	<input type="text" name="source" size="30"/>
            </td>
        </tr>
    <tr>
      <td>内容：</td>
      <td>
      <textarea id="news_content" rows=20 cols=60>
      </textarea>
       <input type="hidden" name="content"/>
      </td>
    </tr>
    <tr>
      <td>时间：</td>
      <td><input type="text" name="time" class="easyui-datebox" />
      <input type="hidden" name="stime"/>
      </td>
    </tr>
    <tr>
      <td>列表样式：</td>
      <td><input type="radio" name="style" 
       value="0"/>普通
       <input type="radio" name="style" value="1" />
       多图
       </td>
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
