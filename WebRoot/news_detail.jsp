<%@page import="com.news.entity.NormalNews"%>
<%@page import="com.news.entity.BaseNews"%>
<%@page import="com.news.service.impl.NewsServiceImpl"%>
<%@page import="com.news.service.NewsService"%>
<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/sun.css" type="text/css"/>
<title>盾安重工全套管全回转钻机绽放宜春百荣百尚</title>
</head>

<body>
<div id="actBox">
	<div id="head">
    	<a href="" target="">
    		<div class="logo"><img src="img/sun.png" alt="21-sun"/></div>
            
        </a>
        <div class="phone"><a href="" target=""><img src="img/phone.png" alt="21-sun"/></a></div>
    </div>
    <div id="banner">
    	<a href="" target="">首页</a>
        <span>&gt;</span>
        <a href="" target="">行业动态</a>
        <span>&gt;</span>
        <span>企业动态</span>
    </div>
    <%
    	String id=request.getParameter("id");
    	//按ID查询新闻（功能）
    	NewsService newsService=new NewsServiceImpl();
    	NormalNews news=newsService.getBaseNews(Integer.parseInt(id));
     %>
    <div id="act">
        <h2><%=news.getTitle() %></h2>
        <time><%=news.getPublishTime() %> </time>
        <span class="text_2">中国工程机械商贸网</span>
        <hr/>
        <p class="text_2">
        	<%=news.getContent() %>
        </p>
    </div>
    <div id="footbox">
    	<div><span>上一条</span><a href="" class="last" target="_parent">北京骏马日立挖掘机</a></div>
        <div><span>上一条</span><a href="" class="next" target="_parent">中国重汽泰安五月公司</a></div>
        <div>
        	<span class="share">分享到：</span>
            <ul>
            <li class="bt1"></li>
            	<li><a href=""><div class="bt1"></div></a></li>
                <li><a href=""><div class="bt2"></div></a></li>
                <li><a href=""><div class="bt3"></div></a></li>
                <li><a href=""><div class="bt4"></div></a></li>
                <li><a href=""><div class="bt5"></div></a></li>
				<li><a href=""><div class="bt6"></div></a></li>
            </ul>
            
        </div>
        <div><span class="keyword">关键词：盾安重工-钻机-工程</span></div>
    </div>
    <div id="footbox">
    	<div class="title">相关动态</div>
        <a href="" target="_parent"><div class="t2">盾安重工全套管全回转钻机绽放宜春百荣百尚</div></a>
        <a href="" target="_parent"><div class="t2">盾安重工严正声明 要求立即停止不法侵权行为</div></a>
        <a href="" target="_parent"><div class="t2">盾安重工闪耀第五届深基础工程发展论坛</div></a>
    </div>
    <div id="search">
    	<form>
    		<input type="text" name="searchbox" placeholder="请输入搜索的内容" />
        	<input type="submit" class="sub" name="searchsubmit" value="" /></form>
        </form>
    </div>
    
</div>
</body>
</html>
