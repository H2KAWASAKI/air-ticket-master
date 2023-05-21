package com.user.dao;

import com.admin.bean.Order;
import com.admin.util.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class indexOrderDao {
    public List<Order> selectOrder(String orderUser ,String flightNumber,String personName,String StartTime, String endTime){
        List<Order> orders=new ArrayList<Order>();
        try {
            Connection connection = JDBCUtils.getConnection();
            String sql = null;
            PreparedStatement ps = null;
            if (flightNumber==null||flightNumber.equals(""))
                flightNumber="%";
            if (personName==null||personName.equals(""))
                personName="%";
            if (StartTime==null||StartTime.equals(""))
                StartTime="%";
            if (endTime==null||endTime.equals(""))
                endTime="%";
            else {
                String[] strs = endTime.split("");
                String num=strs[strs.length-1];
                int n=num.length();
                int nums=Integer.parseInt(num)+1;
                String newNum=String.valueOf(nums);
                n=Math.max(n,newNum.length());
                endTime= endTime.subSequence(0,endTime.length()-n)+newNum;
            }
            if (StartTime != null && endTime != null && !StartTime.equals("%") )
            {
                sql = "select * from `orders` where orderUser like ? and flightNumber like ? and personName like ? and orderDate <= ? and  orderDate >= ?";
                ps = connection.prepareStatement(sql);
                ps.setString(1, orderUser);
                ps.setString(2, flightNumber + "%");
                ps.setString(3, personName + "%");
                ps.setString(4, endTime+"%");
                ps.setString(5, StartTime+"%");
            }
            else {
                sql = "select * from `orders` where orderUser like ? and flightNumber like ? and personName like ? ";
                ps = connection.prepareStatement(sql);
                ps.setString(1, orderUser);
                ps.setString(2, flightNumber);
                ps.setString(3, personName);
            }
            System.out.println(ps);
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

    public void delettOrder(String orderId,String flightNumber,int grade) {
        try {
            Connection connection= JDBCUtils.getConnection();
//            flightId="'"+flightId+"'";
            String sql1="delete from `orders` where orderId like '"+orderId+"'";
            String sql2=null;
            Statement st=connection.createStatement();
            System.out.println(sql1);
            System.out.println(sql2);
            switch (grade){
                case 1 :
                    sql2="UPDATE flight SET flightLowNumber = flightLowNumber + 1 where flightId = '"+orderId+"'";
                    st.executeUpdate(sql2);
                    break;
                case 2 :
                    sql2="UPDATE flight SET flightLowNumber = flightMidNumber + 1 where flightId = '"+orderId+"'";
                    st.executeUpdate(sql2);
                    break;
                case 3 :
                    sql2="UPDATE flight SET flightLowNumber = flightHighNumber + 1 where flightId = '"+orderId+"'";
                    st.executeUpdate(sql2);
                    break;
            }
            st.executeUpdate(sql1);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
