<%--
  Created by IntelliJ IDEA.
  User: 33569
  Date: 2022/6/6
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>新闻管理系统</title>
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
      .div_01{
        text-align: center;
        margin-top: -40px;
      }
      .h2_01{
        margin-top: 50px;
        color: black;
      }
    </style>
  </head>
  <body>
  <h2>新闻管理系统</h2>
  <div class="title">
    <a href="" class="allnews">所有新闻</a>
    <a href="" class="search">添加新闻</a>
    <a href="" class="logout">系统登录</a>
    <a href="" class="detailnews">新闻主页</a>
  </div>
  <hr>
  <h2 class="h2_01">管理员登录</h2>
  <div class="div_01">
    <form action="${pageContext.request.contextPath}/login" method="post">
      <br/><br/><br/>
      管理员账号：<input type="text" name="adminName"><br/><br/>

      管理员密码：<input type="password" name="adminPwd"><br/><br/>

      <input type="submit" value="登录">
    </form>
  </div>
  </body>
</html>
