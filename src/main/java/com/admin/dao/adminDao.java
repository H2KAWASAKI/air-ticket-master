package com.admin.dao;

import com.admin.bean.Admin;
import com.admin.bean.Flight;
import com.admin.bean.Order;
import com.admin.util.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class adminDao {
    public Admin checkAdminByName(String username){
        try {
            Admin admin=null;
            Connection connection= JDBCUtils.getConnection();
            String sql="select user,pwd from admin where user=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,username);
            ResultSet resultSet =ps.executeQuery();
            while (resultSet.next()){
                admin =new Admin();
                admin.setAdminID(1);
                admin.setUsername(resultSet.getString(1));
                admin.setPassword(resultSet.getString(2));
            }
            return admin;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Admin> selectAdmin(String username){
        List<Admin> admins=new ArrayList<Admin>();
        try{
            Connection connection = JDBCUtils.getConnection();
            String sql ="select *from `admin` where user like ?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,username+"%");
            ResultSet resultSet=ps.executeQuery();
            while (resultSet.next()){
                Admin admin =new Admin();
                admin.setUsername(resultSet.getString(1));
                admin.setPassword(resultSet.getString(2));
                admins.add(admin);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return admins;
    }
    public boolean deleteAdmin(String userName){
        try {
            Connection connection= JDBCUtils.getConnection();
//            flightId="'"+flightId+"'";
            String sql="delete from `admin` where user in ("+userName+")";
            Statement st=connection.createStatement();
            st.executeUpdate(sql);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return true;
    }
    public boolean addAdmin(Admin a){
        try {
            Connection connection= JDBCUtils.getConnection();
//            flightId="'"+flightId+"'";
            String sql="INSERT INTO `admin` VALUES (?,?) ";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,a.getUsername());
            ps.setString(2,a.getPassword());
            System.out.println(ps);
            ps.execute();
        }catch (Exception e)
        {
            return false;
//            e.printStackTrace();
        }
        return true;
    }
    public boolean updateAdmin(Admin a){
        try {
            Connection connection= JDBCUtils.getConnection();
//            flightId="'"+flightId+"'";
            String sql="UPDATE  `admin` SET user=?,pwd=? WHERE user=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,a.getUsername());
            ps.setString(2,a.getPassword());
            ps.setString(3,a.getUsername());
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
