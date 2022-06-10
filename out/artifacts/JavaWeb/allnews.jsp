<%--
  Created by IntelliJ IDEA.
  User: 33569
  Date: 2022/6/7
  Time: 9:08
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
    </style>
</head>
<body>
<h2>新闻管理系统</h2>
<div class="title">
    <a href="${pageContext.request.contextPath}/AllNews?flag=1">所有新闻</a>
    <a href="searchNews.jsp">搜索新闻</a>
    <a href="index.jsp">后台管理</a>
</div>
<hr>
</body>
</html>
