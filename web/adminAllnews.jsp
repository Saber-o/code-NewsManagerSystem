<%--
  Created by IntelliJ IDEA.
  User: 33569
  Date: 2022/6/8
  Time: 13:56
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
            margin-left: 350px;
            margin-right: 350px;
        }
        p{
            text-align: center;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <h2>新闻管理系统</h2>

    <div class="title">
        <a href="">所有新闻</a>
        <a href="addnews.jsp">添加新闻</a>
        <a href="allnews.jsp">退出系统</a>
        <a href="">新闻主页</a>
    </div>
    <hr>

    <p>所有新闻列表</p>
    <div class="content">
        <table class="table table-condensed">
            <thead>
            <tr>
                <th>新闻标题</th>
                <th>新闻作者</th>
                <th>新闻类别</th>
                <th>发布时间</th>
                <th>是否编辑</th>
                <th>是否删除</th>
            </tr>
            </thead>
            <tbody>
            <%
                //HashMap<News, News> map = (HashMap)session.getAttribute("map");
                ArrayList<News> list = (ArrayList)session.getAttribute("list");
                //for(News n : map.values()){
                for(News n : list){
            %>
            <tr>
                <td><a href="${pageContext.request.contextPath}/shownews.jsp?id=<%=n.getId()%>"><%=n.getTitle()%></a></td>
                <td><%=n.getAuthor()%></td>
                <td><%=n.getType()%></td>
                <td><%=n.getTime()%></td>
                <td><a href="${pageContext.request.contextPath}/editnews.jsp?id=<%=n.getId()%>&style=edit">编辑</a></td>
                <td><a href="${pageContext.request.contextPath}/deletenews?id=<%=n.getId()%>">删除</a></td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</body>
</html>
