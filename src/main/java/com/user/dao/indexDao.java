package com.user.dao;

import com.admin.bean.*;
import com.admin.util.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class indexDao {

    public List<Flight> selectFlight(String start,String end,String startTime,String endTime){
        List<Flight> flights=new ArrayList<Flight>();
        try{
            Connection connection = JDBCUtils.getConnection();
            String sql ="select *from `flight` where flightStart like ? and flightEnd like ? and  flightStartTime like ? and flightEndTime like ?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,"%"+start+"%");
            ps.setString(2,"%"+end+"%");
            ps.setString(3,"%"+startTime+"%");
            ps.setString(4,"%"+endTime+"%");
            ResultSet resultSet=ps.executeQuery();
            while (resultSet.next()){
                Flight flight=new Flight();
                flight.setFlightId(resultSet.getString(1));
                flight.setFlightNumber(resultSet.getString(2));
                flight.setFlightStart(resultSet.getString(3));
                flight.setFlightEnd(resultSet.getString(4));
                flight.setFlightStartAir(resultSet.getString(5));
                flight.setFlightEndAir(resultSet.getString(6));
                flight.setFlightStartTime(resultSet.getString(7));
                flight.setFlightEndTime(resultSet.getString(8));
                flight.setFlightHighPrice(resultSet.getDouble(9));
                flight.setFlightHighNumber(resultSet.getInt(10));
                flight.setFlightMidPrice(resultSet.getDouble(11));
                flight.setFlightMidNumber(resultSet.getInt(12));
                flight.setFlightLowPrice(resultSet.getDouble(13));
                flight.setFilghtLowNumber(resultSet.getInt(14));
                flight.setDelay(resultSet.getInt(15));
                flights.add(flight);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return flights;
    }



    public void addOrder(Order order) {
        try{
            Connection connection = JDBCUtils.getConnection();
            String sql ="insert  into orders values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,order.getOrderId());
            ps.setString(2,order.getOrderName());
            ps.setString(3,order.getOrderUser());
            ps.setString(4,order.getFlightNumber());
            ps.setString(5,order.getPersonName());
            ps.setString(6, order.getOrderDate());
            ps.setString(7,order.getGrade());
            ps.setString(8,order.getPersonId());
            ps.setDouble(9,order.getOrderMoney1() );
            ps.setDouble(10,order.getOederMoney2());
            ps.setString(11,order.getContcatName());
            ps.setString(12,order.getContactPhone());
            System.out.println(ps);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateFlightNumber(String grade,String flightNumber,int number) {
        try{
            Connection connection = JDBCUtils.getConnection();
            String sql =null;
            if (grade.equals("3"))
                sql="UPDATE  `flight` SET flightHighNumber=?  WHERE flightNumber=?";
            else if (grade.equals("2"))
                sql ="UPDATE  `flight` SET flightMidNumber=?  WHERE flightNumber=?";
            else
                sql ="UPDATE  `flight` SET flightLowNumber=?  WHERE flightNumber=?";

            PreparedStatement ps=connection.prepareStatement(sql);
            number=number-1;
            ps.setInt(1,number);
            ps.setString(2,flightNumber );
//            System.out.println(ps);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public boolean addPerson(Person person) {
        try{
            Connection connection = JDBCUtils.getConnection();
            String sql ="insert  into `person` values(?,?,?, ?)";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,person.getUserName());
            ps.setString(2,person.getPersonName());
            ps.setString(3,person.getPersonId());
            ps.setInt(4,person.getScore());

//            System.out.println(ps);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    public void updatePerson(Person person) {
        try{
            Connection connection = JDBCUtils.getConnection();
            String sql ="update `person` set personId=? ,personName=? ,userScore=? where userName=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,person.getPersonId());
            ps.setString(2,person.getPersonName());
            ps.setInt(3,person.getScore());
            ps.setString(4,person.getUserName());
//            System.out.println(ps);
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public Person searchPerson(String username) {
        Person person=null;
        try{
            Connection connection = JDBCUtils.getConnection();
            String sql ="select * from `person` where userName=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,username);
            ResultSet resultSet=ps.executeQuery();
            while (resultSet.next()){
                person=new Person();
                person.setUserName(resultSet.getString(1));
                person.setPersonName(resultSet.getString(2));
                person.setPersonId(resultSet.getString(3));
                person.setScore(resultSet.getInt(4));
            }
        }catch (Exception e){
            e.printStackTrace();
            return person;
        }
        return person;
    }
    public String selectFlightTime(String flightNumber){
        String startTime=null;
        try{
            Connection connection = JDBCUtils.getConnection();
            String sql ="select flightStartTime from `flight` where flightNumber=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,flightNumber);
            ResultSet resultSet=ps.executeQuery();
            while (resultSet.next()){
                startTime=resultSet.getString(1);
            }
        }catch (Exception e){
            e.printStackTrace();
            return "2019-00-00 00:00:00";
        }
        return startTime;
    }

}
