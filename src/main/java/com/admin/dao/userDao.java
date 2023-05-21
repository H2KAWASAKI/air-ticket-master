package com.admin.dao;

import com.admin.bean.User;
import com.admin.util.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class userDao {
    public List<User> selectUser(){
        List<User> users=new ArrayList<User>();
        try{
            Connection connection = JDBCUtils.getConnection();
            String sql ="SELECT `user`.userName,userPwd,personName,personId,userScore FROM `user` " +
                    "LEFT JOIN person ON user.userName=person.userName ORDER  BY userName;";
            PreparedStatement ps=connection.prepareStatement(sql);
            ResultSet resultSet=ps.executeQuery();
            while (resultSet.next()){
                User user=new User();
                user.setUserName(resultSet.getString(1));
                user.setUserPwd(resultSet.getString(2));
                user.setPersonName(resultSet.getString(3));
                user.setPersonId(resultSet.getString(4));
                user.setScore(resultSet.getInt(5));
                users.add(user);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }

}
