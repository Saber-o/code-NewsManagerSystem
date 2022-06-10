<%--
  Created by IntelliJ IDEA.
  User: 33569
  Date: 2022/6/7
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="model.News" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/bootstrap.min.css" />
    <style>
        h2 {
            color: orange;
            text-align: center;
        }
        .title {
            text-align: center;
        }
        .title a {
            padding: 0 150px;
        }
        hr {
            width: 1000px;
        }
        table{
            text-align: center;
        }
        th{
            text-align: center;
        }
        td{
            white-space: nowrap;
        }
        .content{
            margin-left: 550px;
            margin-right: 550px;
        }
    </style>
</head>
<body>
<%
    String id = request.getParameter("id");
    ArrayList<News> list = (ArrayList)session.getAttribute("list");

    for(News n : list){
        if (Integer.toString(n.getId()).equals(id)){
%>

<h2>新闻管理系统</h2>

<div class="title">
    <a href="${pageContext.request.contextPath}/AllNews?flag=1" class="allnews">所有新闻</a>
    <a href="searchNews.jsp" class="search">搜索新闻</a>
    <a href="index.jsp" class="login">后台管理</a>
</div>
<hr>

<div class="content">
    <table class="table">
        <thead>
        <tr>
            <td>新闻标题</td>
            <th><%=n.getTitle()%></th>
        </tr>
        <tr>
            <td>新闻类型</td>
            <th><%=n.getType()%></th>
        </tr>
        <tr>
            <td>新闻作者</td>
            <th><%=n.getAuthor()%></th>
        </tr>
        <tr>
            <td>新闻内容</td>
            <th><%=n.getContent()%></th>
        </tr>
        <tr>
            <th>发布时间</th>
            <th><%=n.getTime()%></th>
        </tr>
        </thead>
        <%}}%>
    </table>
</div>
</body>
</html>
