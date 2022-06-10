<%--
  Created by IntelliJ IDEA.
  User: 33569
  Date: 2022/6/8
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/bootstrap.min.css" />
    <style>
        h2{
            color:orange;
            text-align:center;
        }
        .title{
            text-align: center;
        }
        a{
            padding: 0 100px;
        }
        hr{
            width: 1000px;
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
</body>
</html>
