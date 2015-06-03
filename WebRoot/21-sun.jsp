<%@page import="com.news.entity.PageBean"%>
<%@page import="com.news.entity.BaseNews"%>
<%@page import="com.news.service.NewsService"%>
<%@page import="com.news.service.impl.NewsServiceImpl"%>
<%@page import="com.news.entity.Channel"%>
<%@page import="java.util.List"%>
<%@page import="com.news.service.impl.ChannelServiceImpl"%>
<%@page import="com.news.service.ChannelService"%>
<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/sun.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<title>最新要闻--行业动态--中国工程机械动态网,工程机械动态,工程机械信息,工程机械动态,最新工程机械行业信息,尽在中国工程机械商贸网行业动态</title>
<%
	String cid=request.getParameter("channelid");
	if(cid==null||cid==""){
		cid="0";
	}
	String pageNo=request.getParameter("pageNo");
	if(pageNo==null||pageNo.equals("")){
		pageNo="1";
	}
   NewsService newsService=new NewsServiceImpl();
   PageBean pageBean=newsService.getBaseNewsList(Integer.parseInt(cid), Integer.parseInt(pageNo), 10);
   int pageCount=pageBean.getPageCount();
   List<BaseNews> baseNewsList=pageBean.getData();
   
 %>
<script>
$(function(){
	$(window).scroll(function(){
		var footHeight=50;
		//当底部基本距离+滚动的高度〉=文档的高度-窗体的高度时
		if(footHeight+$(window).scrollTop()>=$(document).height()-$(window).height()){
			var pageNo=<%=pageNo%>;
			var pageCount=<%=pageCount%>;
			if(pageNo!=pageCount){
				window.location.href="21-sun.jsp?pageNo="+(pageNo+1);
			}
		}
	});
});
</script>
</head>

<body>

<div id="box">

	<div id="head">
    	<a href="" target="">
    		<div class="logo"><img src="img/sun.png" alt="21-sun"/></div>
            <div>最新要闻</div>
            
        </a>
       
        <div class="phone"><a href="" target=""><img src="img/phone.png" alt="21-sun"/></a></div>
    </div>
    <div id="content">
    	<ul>
        	<li><a href="21-sun.jsp" target="_self">今日</a></li>
        	<%
        		ChannelService  channelService=new ChannelServiceImpl();
        		List<Channel> channels=channelService.getChannelList();
        	 	for(int i=0;i<channels.size();i++){
        	 		Channel channel=channels.get(i);
        	 		
        	 %>
        	 
	            <li><a href="21-sun.jsp?channelid=<%=channel.getId() %>" 
	             target="_self">
	            <%=channel.getChannel() %></a></li>
         	<%} %>
        </ul>
    </div>
    <div id="search">
    	<form>
    		<input type="text" name="searchbox" placeholder="请输入搜索的内容" />
        	<input type="submit" class="sub" name="searchsubmit" value="" /></form>
        </form>
    </div>
    <div id="banner">
    	<a href="" target="">首页</a>
        <span>&gt;</span>
        <a href="" target="">行业动态</a>
        <span>&gt;</span>
        <span>最新要闻</span>
    </div>
    <div id="newsBox">
        <ul>
        <%
  
        	for(int i=0;i<baseNewsList.size();i++){
        		BaseNews news=baseNewsList.get(i);
        		int style=news.getStyle();
        	
         %>
        	<li >
            	<%
            	if(style==0){
            		if(news.getSmallImg()!=null&&!news.getSmallImg().equals("")){
            	 %>
                <img src="<%=news.getSmallImg() %>" alt=""  style="float: left; margin-right: 5px"/>
                <%} %>
                    <div>
                    	<h3 >
                    	<a href="news_detail.jsp?id=<%=news.getId() %>" target="">
                    	<%=news.getTitle() %>
                    	</a>
                    	
                    	</h3>
                    	<time><%=news.getPublishTime() %></time>
                    </div>
                	<div class="space" style="clear:both;"></div>
          
            <% } else if(style==1){
            	String[] imgs=news.getSmallImg().split(",");
            %>
            	<div style="margin-bottom: 5px">
            		   <h3>
                    	<a href="news_detail.jsp?id=<%=news.getId() %>" target="">
                    	<%=news.getTitle() %>
                    	</a>
                    	</h3>
            	</div>
            	<%
            		for(int j=0;j<imgs.length;j++){
            	 %>
            	 <img src="<%=imgs[j]%>" alt="" style="margin-right: 10px"/>
            	 
            	 
            <% 	}
            %>
            	<div>
            	<time><%=news.getPublishTime() %></time>
            	</div>
            <% 
            } 
            %>
                </li>
            <%
           }%>
       
        </ul>
    
    </div>
    <div id=""></div>
</div>
<div id="bottom">
	<div><a href="sun_21.html"><img src="img/shouye.png" /></a></div>
    <div><a href="#"><img src="img/dongtai.png" /></a></div>
    <div><a href="#"><img src="img/gouji.png" /></a></div>
    <div><a href="sun_second.html"><img src="img/ershou.png" /></a></div>
    <div><a href="#"><img src="img/koubei.png" /></a></div>
   	<div><a href="#"><img src="img/luntan.png" /></a></div>
</div>
</body>
</html>
