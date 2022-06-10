package Servlet;

import util.DBUtil;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String adminName = request.getParameter("adminName");
        String adminPwd = request.getParameter("adminPwd");
        if(adminName.equals("") || adminPwd.equals("")){
            request.setAttribute("loginError", "用户名或密码不能为空");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else{
            DBUtil db = new DBUtil();
            Connection conn = db.getConnection();
            ResultSet rs = db.getResultSet("select * from admin where adminname=? and adminpass=?", new String[]{adminName, adminPwd});
            try{
                if(rs != null && rs.next()){
                    HttpSession session = request.getSession();
                    session.setAttribute("adminName", adminName);
                    response.sendRedirect("adminNews.jsp");
                }else{
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
            }catch(SQLException e){
                e.printStackTrace();
            }finally {
                if(db != null)
                    db.release();
            }
            }
        }
    }

