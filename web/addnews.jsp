<%--
  Created by IntelliJ IDEA.
  User: 33569
  Date: 2022/6/8
  Time: 20:36
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
        p{
            text-align: center;
            font-size: 20px;
        }
        .submit{
            margin-left: 580px;
        }
    </style>
</head>
<body>
    <h2>新闻管理系统</h2>

    <div class="title">
        <a href="${pageContext.request.contextPath}/AllNews?flag=0">所有新闻</a>
        <a href="">添加新闻</a>
        <a href="allnews.jsp">退出系统</a>
        <a href="">新闻主页</a>
    </div>
    <hr>

    <p>添加新闻</p>

    <form action="${pageContext.request.contextPath}/addNews" method="post">
        <div class="content">
            <form role="form">
                <div class="form-group">
                    <label>新闻标题：</label>
                    <input name="title" type="text" class="form-control" placeholder="请输入标题">
                    <label>新闻内容：</label>
                    <textarea name="content" class="form-control" rows="10" placeholder="请输入内容"></textarea>
                    <label>新闻类型：</label>
                    <input name="type" type="text" class="form-control" placeholder="请输入类型">
                    <label>新闻作者：</label>
                    <input name="author" type="text" class="form-control" placeholder="请输入作者">
                </div>
                <input class="submit" type="submit" value="添加">
            </form>
        </div>
    </form>
</body>
</html>
