package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import util.DBUtil;

@WebServlet(name = "editNews", value = "/editNews")
public class editNews extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBUtil db = new DBUtil();
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String author = request.getParameter("author");
        String content = request.getParameter("content");
        Connection con = db.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("update newsdetail set title=?,type=?,author=?,content=?" +
                    "where id=?");
            ps.setString(1, title);
            ps.setString(2, type);
            ps.setString(3, author);
            ps.setString(4, content);
            ps.setInt(5, Integer.parseInt(id));
            int i = ps.executeUpdate();
            if(i > 0){
                System.out.print("修改成功");
                response.sendRedirect("adminNews.jsp");
            }else{
                System.out.print("修改失败");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            if(db != null)
                db.release();
        }
    }
}
