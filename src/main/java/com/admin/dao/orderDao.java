package com.admin.dao;

import com.admin.bean.Order;
import com.admin.util.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class orderDao {
    public List<Order> selectOrder(String orderDate){
        List<Order> orders=new ArrayList<Order>();
        try{
            Connection connection = JDBCUtils.getConnection();
            String sql ="select *from `orders` where orderDate like ?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,orderDate+"%");
            ResultSet resultSet=ps.executeQuery();
            while (resultSet.next()){
                Order order=new Order();
                order.setOrderId(resultSet.getString(1));
                order.setOrderName(resultSet.getString(2));
                order.setOrderUser(resultSet.getString(3));
                order.setFlightNumber(resultSet.getString(4));
                order.setPersonName(resultSet.getString(5));
                order.setOrderDate(resultSet.getString(6));
                order.setGrade(resultSet.getString(7));
                order.setPersonId(resultSet.getString(8));
                order.setOrderMoney1(resultSet.getDouble(9));
                order.setOederMoney2(resultSet.getDouble(10));
                order.setContcatName(resultSet.getString(11));
                order.setContactPhone(resultSet.getString(12));
                orders.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return orders;
    }
    public boolean deleteOrder(String orderId){
        try {
            Connection connection= JDBCUtils.getConnection();
//            flightId="'"+flightId+"'";
            String sql="delete from `orders` where orderId in ("+orderId+")";
            Statement st=connection.createStatement();
//            System.out.println(orderId+"\n"+sql);
            st.executeUpdate(sql);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }
}
