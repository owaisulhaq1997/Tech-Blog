package com.tech.blog.dao;

import java.sql.*;
public class LikeDao {
    private Connection con;
    public LikeDao(Connection con){
        this.con = con;
    }
    public boolean insertLike(int pid, int uid){
        try{
            String query = "insert into likes(post_id,user_id) values (?,?)";
            PreparedStatement ps = this.con.prepareCall(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public int countLikesOnPost(int pid){
        int count = 0;
        try{
            String query = "select count(*) from likes where post_id=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet set = ps.executeQuery();
            while(set.next()){
                count = set.getInt("count(*)");
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return count;
    }
    public boolean isLikedByUser(int pid, int uid){
        try{
            String query = "select * from likes where post_id=? and user_id=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ResultSet set = ps.executeQuery();
            if(set.next()){
                return true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public boolean disLikedByUser(int pid, int uid){
        try{
            String query = "delete from likes where post_id=? and user_id=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, pid);
            ps.setInt(2, uid);
            ps.executeUpdate(query);
            return true;
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return false;
    }
}
