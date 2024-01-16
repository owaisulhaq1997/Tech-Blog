
package com.tech.blog.entities;
import java.sql.*;

public class User {
    private int userId;
    private String username;
    private String email;
    private String password; 
    private String gender;
    private Timestamp reg_date;
//    default constructor
    public User() {
    }
//    parameterized constructor
    public User(String username, String email, String password, String gender) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
    }
//    setters and getters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", username=" + username + ", email=" + email + ", password=" + password + ", gender=" + gender + ", reg_date=" + reg_date + '}';
    }
    
}
