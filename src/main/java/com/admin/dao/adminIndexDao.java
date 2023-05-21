package com.admin.dao;

import com.admin.util.JDBCUtils;


import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.Map;

public class adminIndexDao {
    Connection connection= JDBCUtils.getConnection();
    public int allOrder() throws SQLException {//订单总量
        String sql="select count(*) from `orders` ";
        Statement st=connection.createStatement();
        ResultSet resultSet=st.executeQuery(sql);
        int res=0;
        while (resultSet.next())
        {
            res=resultSet.getInt(1);
        }
        return res;
    }
    public int allUser() throws SQLException {//用户总量
        String sql="select count(*) from `user` ";
        Statement st=connection.createStatement();
        ResultSet resultSet=st.executeQuery(sql);
        int res=0;
        while (resultSet.next())
        {
            res=resultSet.getInt(1);
        }
        return res;
    }

    public int allPerson() throws SQLException {//会员总量
        String sql="select count(*) from `person` ";
        Statement st=connection.createStatement();
        ResultSet resultSet=st.executeQuery(sql);
        int res=0;
        while (resultSet.next())
        {
            res=resultSet.getInt(1);
        }
        return res;
    }




    public int allFlight() throws SQLException {//航班总量
        String sql="select count(*) from `flight` ";
        Statement st=connection.createStatement();
        ResultSet resultSet=st.executeQuery(sql);
        int res=0;
        while (resultSet.next())
        {
            res=resultSet.getInt(1);
        }
        return res;
    }
    public int newOrder() throws SQLException {//新增用户总量
        String sql="SELECT orderDate ,COUNT(*) FROM `orders` GROUP BY orderDate ORDER BY 1 DESC LIMIT 1";
        Statement st=connection.createStatement();
        ResultSet resultSet=st.executeQuery(sql);
        int res=0;
        while (resultSet.next())
        {
            res=resultSet.getInt(2);
        }
        return res;
    }


    public Map<String, Integer> orderDiff() throws SQLException {
        Map<String,Integer> map=new LinkedHashMap<>();
        String sql="SELECT DATE_FORMAT(orderDate, '%Y-%m-%d'), COUNT(*) FROM `orders` GROUP BY DATE_FORMAT(orderDate, '%Y-%m-%d') ORDER BY DATE_FORMAT(orderDate, '%Y-%m-%d') DESC LIMIT 5";
        Statement st=connection.createStatement();

        ResultSet resultSet=st.executeQuery(sql);
        while (resultSet.next()){
            Date date = resultSet.getDate(1);
            String orderDate = String.valueOf(date);
            orderDate  = orderDate.replaceAll("[[\\s-:punct:]]","");
            int count=resultSet.getInt(2);
            map.put(orderDate,count);
        }
        return map;
    }

}
