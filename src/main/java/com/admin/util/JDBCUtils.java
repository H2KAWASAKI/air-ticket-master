package com.admin.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtils {
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            /*String url="jdbc:mysql://110.42.210.89/airTicket";*/
            String url="jdbc:mysql://localhost:3306/airTicket?serverTimezone=UTC";
            String user ="root";
            String password="yfy1410514150";
            Connection connection = DriverManager.getConnection(url,user,password);
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
//    public static void close(Connection conn) {
//        if (conn != null) {
//            try {
//                conn.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }

}
