<%--
  Created by IntelliJ IDEA.
  User: 33569
  Date: 2022/6/8
  Time: 11:27
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
        .content{
            margin-left: 550px;
            margin-right: 550px;
        }
        p{
            margin-left: 550px;
            font-size: 18px;
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
<form action="${pageContext.request.contextPath}/SearchNews" method="post">
    <form role="form">
        <div class="form-group">
            <input name="newsName" type="text" class="form-control" placeholder="请输入搜索关键词">
            <input class="btn" type="submit" value="搜索新闻">
        </div>
    </form>
</form>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
%>
<p>您搜索的关键字是：<%=session.getAttribute("newsName")%>，搜索结果如下：</p>
<div class="content">
    <table class="table table-condensed">
        <thead>
        <tr>
            <th>新闻标题</th>
            <th>新闻作者</th>
            <th>发布时间</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<News> list = (ArrayList)session.getAttribute("list");
            for(News n : list) {
        %>
        <tr>
            <td><a href="${pageContext.request.contextPath}/shownews.jsp?id=<%=n.getId()%>"><%=n.getTitle()%></a></td>
            <td><%=n.getAuthor()%></td>
            <td><%=n.getTime()%></td>
        </tr>
        </tbody>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
