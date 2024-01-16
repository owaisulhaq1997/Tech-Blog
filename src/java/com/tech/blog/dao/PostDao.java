package com.tech.blog.dao;

import com.mysql.jdbc.Statement;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() throws SQLException {
        ArrayList<Category> categories = new ArrayList<>();
        try {
            String query = "select * from category";
            Statement st = (Statement) this.con.createStatement();
            ResultSet set = st.executeQuery(query);
            while (set.next()) {
                categories.add(new Category(set.getInt("cid"), set.getString("cname"), set.getString("cdescription")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }

    public boolean savePost(Post p) {
        try {
            String query = "insert into post(pTitle,pContent,pCode,cid,userId) values (?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setInt(4, p.getcId());
            pstmt.setInt(5, p.getUserId());
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Post> getAllPosts() throws SQLException {
        List<Post> posts = new ArrayList<Post>();
        PreparedStatement ps = con.prepareStatement("select * from post order by pid desc");
        ResultSet set = ps.executeQuery();
        while (set.next()) {
            Post post = new Post(set.getInt("pid"), set.getString("pTitle"), set.getString("pContent"), set.getString("pCode"), set.getTimestamp("pDate"), set.getInt("cId"), set.getInt("userId"));
            posts.add(post);
        }
        return posts;
    }

    public List<Post> getPostByCategory(int cId) throws SQLException {
        List<Post> posts = new ArrayList<Post>();
        PreparedStatement ps = con.prepareStatement("select * from post where cId=? order by pid desc");
        ps.setInt(1, cId);
        ResultSet set = ps.executeQuery();
        while (set.next()) {
            Post post = new Post(set.getInt("pid"), set.getString("pTitle"), set.getString("pContent"), set.getString("pCode"), set.getTimestamp("pDate"), cId, set.getInt("userId"));
            posts.add(post);
        }
        return posts;
    }

    public Post getPostByPostId(int postId) throws SQLException {
        Post post = null;
        String query = "select * from post where pid=?";
        PreparedStatement ps = this.con.prepareStatement(query);
        ps.setInt(1, postId);
        ResultSet set = ps.executeQuery();
        while (set.next()) {
            post = new Post(postId,set.getString("pTitle"), set.getString("pContent"), set.getString("pCode"), set.getTimestamp("pDate"), set.getInt("cid"), set.getInt("userId"));
        }
        return post;
    }
}
