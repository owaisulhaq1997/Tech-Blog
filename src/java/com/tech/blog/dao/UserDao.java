package com.tech.blog.dao;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.tech.blog.entities.User;
import java.sql.SQLException;
import java.sql.ResultSet;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public String saveUser(User user) {
        try {
            String query = "insert into user(username,email,password,gender) values (?,?,?,?)";
            PreparedStatement ps = (PreparedStatement) this.con.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }
        return "success";
    }

    public User getUserByEmailAndPassword(String email, String password) throws SQLException {
        User user = null;
        String query = "select * from user where email=? and password=?";
        PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet set = ps.executeQuery();
        if (set.next()) {
            user = new User();
            user.setUserId(set.getInt("userId"));
            user.setUsername(set.getString("username"));
            user.setEmail(set.getString("email"));
            user.setPassword(set.getString("password"));
            user.setGender(set.getString("gender"));
            user.setReg_date(set.getTimestamp("reg_date"));
        }
        return user;
    }
    
    public User getUserByUserId(int userId) throws SQLException{
        User user = null;
        String query = "select * from user where userId=?";
        PreparedStatement ps = (PreparedStatement) this.con.prepareStatement(query);
        ps.setInt(1, userId);
        ResultSet set = ps.executeQuery();
        while(set.next()){
            user = new User(set.getString("username"),set.getString("email"),set.getString("password"),set.getString("gender"));
        }
        return user;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean flag = true;
        try {
            String query = "update user set username=?, email=?, password=?, gender=? where userId=?";
            PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setInt(5, user.getUserId());
            ps.executeUpdate();
            System.out.println("updated user:"+user.toString());
             return flag;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
         flag = false;
         return flag;
    }
   
}
