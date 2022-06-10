<%--
  Created by IntelliJ IDEA.
  User: 33569
  Date: 2022/6/8
  Time: 14:57
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
            padding: 0 100px;
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
        .content{
            margin-left: 650px;
            margin-right: 650px;
        }
        .submit{
            margin-left: 550px;
        }
    </style>
</head>
<body>

<h2>新闻管理系统</h2>

<div class="title">
    <a href="${pageContext.request.contextPath}/AllNews?flag=0">所有新闻</a>
    <a href="addnews.jsp">添加新闻</a>
    <a href="allnews.jsp">退出系统</a>
    <a href="">新闻主页</a>
</div>
<hr>

<%
    String id = request.getParameter("id");
    ArrayList<News> list = (ArrayList)session.getAttribute("list");

    for(News n : list){
        if (Integer.toString(n.getId()).equals(id)){
%>
<form action="${pageContext.request.contextPath}/editNews?id=<%=n.getId()%>" method="post">
<div class="content">
    <form role="form">
        <div class="form-group">
            <label>新闻标题：</label>
            <input name="title" type="text" class="form-control" placeholder="输入标题" value="<%=n.getTitle()%>">
            <label>新闻类型：</label>
            <input name="type" type="text" class="form-control" placeholder="输入类型" value="<%=n.getType()%>">
            <label>新闻作者：</label>
            <input name="author" type="text" class="form-control" placeholder="输入作者" value="<%=n.getAuthor()%>">
            <label>新闻内容：</label>
            <textarea name="content" class="form-control" rows="10"><%=n.getContent()%></textarea>
            发布时间：<%=n.getTime()%>
        </div>
        <input class="submit" type="submit" value="编辑提交">
    </form>
</div>
</form>
<%}}%>
</body>
</html>
