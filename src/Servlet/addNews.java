package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import util.DBUtil;
import java.util.Date;


@WebServlet(name = "addNews", value = "/addNews")
public class addNews extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBUtil db = new DBUtil();
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String type = request.getParameter("type");
        String author = request.getParameter("author");
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = df.format(date);
        Connection con = db.getConnection();
        try {
            PreparedStatement  ps = con.prepareStatement("insert into newsdetail(title, content, type, author, time) values(?, ?, ?, ?, ?)");
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, type);
            ps.setString(4, author);
            ps.setString(5, time);
            int i = ps.executeUpdate();
            if(i > 0){
                System.out.print("增加成功");
                response.sendRedirect("adminNews.jsp");
            }else{
                System.out.print("增加失败");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            if(db != null)
                db.release();
        }
    }
}
