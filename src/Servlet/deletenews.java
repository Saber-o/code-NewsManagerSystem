package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import util.DBUtil;

@WebServlet(name = "deletenews", value = "/deletenews")
public class deletenews extends HttpServlet {
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
        Connection con = db.getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("delete from newsdetail where id=?");
            ps.setInt(1, Integer.parseInt(id));
            int i = ps.executeUpdate();
            if(i > 0){
                System.out.print("É¾³ý³É¹¦");
                response.sendRedirect("adminNews.jsp");
            }else{
                System.out.print("É¾³ýÊ§°Ü");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            if(db != null)
                db.release();
        }
    }
}
