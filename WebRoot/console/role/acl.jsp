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


<form action="" >
<ul id="tt" class="easyui-tree" >
	
    <li>
        <span>权限设置</span>
        <c:forEach items="${models}" var="model">
        <ul>
            <li>
                <span>${model.name }<input type="checkbox" name="mid"
                 value="${model.id }" onchange="selNodes(this)" /></span>
              	<c:if test="${!empty model.childModel }">
                <ul>
                 	<c:forEach items="${ model.childModel}" var="child">
                    <li>
                    <span>${child.name }<input type="checkbox" name="mid" value="${model.id }"/></span></li>
                   
                    </c:forEach>
                </ul>
                </c:if>
            </li>
           
        </ul>
        </c:forEach>
    </li>

</ul>

<div id="acl_tools" style="background:#fafafa;">
	<a href="#" class="easyui-linkbutton">提交</a>
</div>
</form>
</div>

</body>
</html>
