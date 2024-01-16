package com.tech.blog.entities;

import java.sql.*;

public class Post {
    private int pId;
    private String pTitle;
    private String pContent;
    private String pCode;
    //private String pPic;
    private Timestamp pDate;
    private int cId;
    private int userId;

    public Post() {
    }

    public Post(int pId, String pTitle, String pContent, String pCode, Timestamp pDate, int cId, int userId) {
        this.pId = pId;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        //this.pPic = pPic;
        this.pDate = pDate;
        this.cId = cId;
        this.userId = userId;
    }

    public Post(String pTitle, String pContent, String pCode, Timestamp pDate, int cId, int userId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
       // this.pPic = pPic;
        this.pDate = pDate;
        this.cId = cId;
        this.userId = userId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
   
}
