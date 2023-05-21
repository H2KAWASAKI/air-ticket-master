package com.user.dao;

import com.admin.bean.Admin;
import com.admin.util.JDBCUtils;
import com.user.bean.indexUser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class indexUserDao {
    public indexUser checkUserByName(String username){
        try {
            indexUser user=null;
            Connection connection= JDBCUtils.getConnection();
            String sql="select userName,userPwd from user where userName=?";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,username);
            ResultSet resultSet =ps.executeQuery();
            while (resultSet.next()){
                user=new indexUser();
                user.setUserID(1);
                user.setUsername(resultSet.getString(1));
                user.setPassword(resultSet.getString(2));
            }
            return user;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean addUser(indexUser user){
        try {
            Connection connection= JDBCUtils.getConnection();
//            flightId="'"+flightId+"'";
            String sql="INSERT INTO `user` VALUES (?,?) ";
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setString(1,user.getUsername());
            ps.setString(2,user.getPassword());
            System.out.println(ps);
            ps.execute();
        }catch (Exception e)
        {
            return false;
//            e.printStackTrace();
        }
        return true;
    }
}
