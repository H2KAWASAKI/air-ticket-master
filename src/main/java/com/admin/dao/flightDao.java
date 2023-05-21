package com.admin.dao;


import com.admin.bean.Flight;
import com.admin.util.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class flightDao {
    public List<Flight> selectFlight(String flightnumber ){
        List<Flight>fl=new ArrayList<Flight>();
        try {
            Connection connection= JDBCUtils.getConnection();
            String sql="select * from `flight` where flightNumber like ? ";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,flightnumber);
            ResultSet resultSet =ps.executeQuery();
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
                fl.add(flight);

            }
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return fl;
    }
    public boolean addFilght(Flight f){
        try {
            Connection connection= JDBCUtils.getConnection();
//            flightId="'"+flightId+"'";
            String sql="INSERT INTO flight VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,f.getFlightId());
            ps.setString(2,f.getFlightNumber());
            ps.setString(3,f.getFlightStart());
            ps.setString(4,f.getFlightEnd());
            ps.setString(5,f.getFlightStartAir());
            ps.setString(6,f.getFlightEndAir());
            ps.setString(7,f.getFlightStartTime());
            ps.setString(8,f.getFlightEndTime());
            ps.setDouble(9,f.getFlightHighPrice());
            ps.setInt(10,f.getFlightHighNumber());
            ps.setDouble(11,f.getFlightMidPrice());
            ps.setInt(12,f.getFlightMidNumber());
            ps.setDouble(13,f.getFlightLowPrice());
            ps.setInt(14,f.getFlightLowNumber());
            ps.setInt(15,f.getDelay());
            System.out.println(ps);
            ps.execute();
        }catch (Exception e)
        {
            return false;
//            e.printStackTrace();
        }
        return true;
    }
    public boolean deleteFilght(String flightId){
        try {
            Connection connection= JDBCUtils.getConnection();
//            flightId="'"+flightId+"'";
            String sql="delete from flight where flightId in ("+flightId+")";
            Statement st=connection.createStatement();
            System.out.println(flightId+"\n"+sql);
            st.executeUpdate(sql);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }
    public boolean updateFlight(Flight f){
        try {
            Connection connection= JDBCUtils.getConnection();
//            flightId="'"+flightId+"'";
            String sql="UPDATE  flight SET flightNumber=?,flightStart=?,flightEnd=?,flightStartAir=?, flightEndAir=? ,flightStartTime=?,flightEndTime=?, " +
                    "flightHighPrice=?,flightHighNumber=?," +
                    "flightMidPrice=?,flightMidNumber=?," +
                    "flightLowPrice=?,flightLowNumber=?," +
                    "delay=? " +
                    "WHERE flightId=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,f.getFlightNumber());
            ps.setString(2,f.getFlightStart());
            ps.setString(3,f.getFlightEnd());
            ps.setString(4,f.getFlightStartAir());
            ps.setString(5,f.getFlightEndAir());
            ps.setString(6,f.getFlightStartTime());
            ps.setString(7,f.getFlightEndTime());

            ps.setDouble(8,f.getFlightHighPrice());
            ps.setInt(9,f.getFlightHighNumber());
            ps.setDouble(10,f.getFlightMidPrice());
            ps.setInt(11,f.getFlightMidNumber());
            ps.setDouble(12,f.getFlightLowPrice());
            ps.setInt(13,f.getFlightLowNumber());
            ps.setInt(14,f.getDelay());
            ps.setString(15,f.getFlightId());
            System.out.println(ps);
            ps.executeUpdate();
        }catch (Exception e)
        {
            return false;
//            e.printStackTrace();
        }
        return true;
    }

}
