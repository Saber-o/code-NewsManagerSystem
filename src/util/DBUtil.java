package util;

import java.sql.*;

public class DBUtil {
    Connection conn = null;
    Statement stat = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String url = "jdbc:mysql://localhost:3306/newsmanager?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT";

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, "root", "123456");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void release(){
        try{
            if(rs != null)
                rs.close();
            if(stat != null)
                stat.close();
            if(conn != null)
                conn.close();
            if(ps != null)
                ps.close();
        }catch (SQLException e){
            e.printStackTrace();
            System.out.println("SQL Exception --release");
        }
    }

    public ResultSet getResultSet(String sql) {
        rs = null;
        if(conn == null)
            conn = this.getConnection();
        try{
            stat = conn.createStatement();
            rs = stat.executeQuery(sql);
        }catch(SQLException e){
            e.printStackTrace();
        }
        return rs;
    }

    public ResultSet getResultSet(String sql, String[] args){
        rs = null;
        if(conn == null)
            conn = this.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            for(int i = 0;i < args.length;i++){
                ps.setString(i + 1, args[i]);
            }
            rs = ps.executeQuery();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return rs;
    }

    public int updateResult(String sql) {
        int n = 0;
        if (conn == null) conn=this.getConnection();
        try {
            stat = conn.createStatement();
            n = stat.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }


    public int updateResult(String sql,String[] args) {
        int n = 0;
        if (conn == null) conn=this.getConnection();
        try {
            ps = conn.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                ps.setString(i + 1, args[i]);
            }
            n = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

//    public static void main(String[] args){
//        DBUtil db = new DBUtil();
//        //ResultSet rs = db.getResultSet("select * from user;");
//        ResultSet rs = db.getResultSet("select * from user where Host=? and User=?;", new String[]{"localhost", "root"});
//        try{
//            while(rs.next()){
//                System.out.println(rs.getString("Host") + " ");
//                System.out.println(rs.getString("User"));
//            }
//        }catch(SQLException e){
//            e.printStackTrace();
//        }finally {
//            if(db != null)
//                db.release();
//        }
//    }
}


