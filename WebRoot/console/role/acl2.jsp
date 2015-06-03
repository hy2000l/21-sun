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
<style type="text/css">
li{list-style: none;}
</style>
<link href="console/themes/default/easyui.css" rel="stylesheet"  type="text/css"/>
<link href="console/themes/icon.css" rel="stylesheet"  type="text/css"/>
<script type="text/javascript" src="console/js/jquery-1.7.2.min.js"></script>
<script src="console/js/jquery.easyui.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$("#panel").panel({
		title:'   ',
		fit:true
	});
});
function selNodes(obj){
	
}
</script>
</head>
<body>
<div id="panel" style="padding: 2px">

<form action="role/SetAclServlet" method="post" >
	<input type="hidden" name="rid" value="${param.rid }"/>
	<ul>
	<c:forEach items="${requestScope.models }" var="model">
		<li>
		<c:if test="${model.level==2 }">
			&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
		${model.name }
		<c:if test="${model.check==1 }">
		<input type="checkbox" name="mid" value="${model.id }" 
		checked="checked"/>
			
		</c:if>
		<c:if test="${model.check==0}">
				<input type="checkbox" name="mid" 
				value="${model.id }" />
		</c:if>
		</li>
	</c:forEach>
	</ul>
	<input type="submit" value="提交"/>
</form>
</div>

</body>
</html>
