package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;
import model.News;
import util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "SearchNews", value = "/SearchNews")
public class SearchNews extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();
        String newsName = request.getParameter("newsName");
        DBUtil db = new DBUtil();
        Connection con = db.getConnection();
        PreparedStatement ps = null;
        ArrayList<News> list=new ArrayList<News>();
        try {
            ps = con.prepareStatement("select * from newsdetail where title like ?");
            ps.setString(1, "%"+newsName+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                    News n= new News();
                    n.setId(rs.getInt("id"));
                    n.setTitle(rs.getString("title"));
                    n.setContent(rs.getString("content"));
                    n.setAuthor(rs.getString("author"));
                    n.setTime(rs.getString("time"));
                    n.setType(rs.getString("type"));
                    list.add(n);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                if(db != null)
                    db.release();
            }
            session.setAttribute("newsName", newsName);
            session.setAttribute("list", list);
            response.sendRedirect("search.jsp");
    }
}
