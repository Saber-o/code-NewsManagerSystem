<%--
  Created by IntelliJ IDEA.
  User: 33569
  Date: 2022/6/9
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/bootstrap.min.css" />
    <style type="text/css">
        h2{
            color:orange;
            text-align:center;
        }
        .title{
            text-align: center;
        }
        a{
            padding: 0 150px;
        }
        hr{
            width: 1000px;
        }
        .form-group{
            margin-left: 700px;
            margin-right: 700px;
        }
        .form-group .btn{
            margin-left: 440px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<h2>新闻管理系统</h2>
<div class="title">
    <a href="${pageContext.request.contextPath}/AllNews?flag=1">所有新闻</a>
    <a href="">搜索新闻</a>
    <a href="index.jsp">后台管理</a>
</div>
<hr>

<form action="${pageContext.request.contextPath}/SearchNews" method="post">
    <form role="form">
        <div class="form-group">
            <input name="newsName" required="required" type="text" class="form-control" placeholder="请输入搜索关键词">
            <input class="btn" type="submit" value="搜索新闻">
        </div>
    </form>
</form>
</body>
</html>
