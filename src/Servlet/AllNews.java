package Servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.News;
import util.DBUtil;


@WebServlet(name = "AllNews", value = "/AllNews")
public class AllNews extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session= request.getSession();
        DBUtil db = new DBUtil();
        ResultSet rs = db.getResultSet("select * from newsdetail");
        ArrayList<News> list=new ArrayList<News>();
        //HashMap<News, News> map = new HashMap<News, News>();
        String flag = request.getParameter("flag");

        try {
            while(rs.next()) {
                News n= new News();
                n.setId(rs.getInt("id"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setAuthor(rs.getString("author"));
                n.setTime(rs.getString("time"));
                n.setType(rs.getString("type"));
                list.add(n);
                //map.put(n, n);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            if(db!=null) {
                db.release();
            }
        }
        session.setAttribute("list", list);
        //session.setAttribute("map", map);
        if(Integer.parseInt(flag) == 1){
            response.sendRedirect("new.jsp");
        }
        if(Integer.parseInt(flag) == 0){
            response.sendRedirect("adminAllnews.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
