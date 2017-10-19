/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author USER
 */
public class Lesson {

    private int lid;
    private String title;
    private int uid, share;

    public Lesson() {
    }

    public Lesson(int lid, String title, int uid, int share) {
        this.lid = lid;
        this.title = title;
        this.uid = uid;
        this.share = share;
    }

    public boolean createLesson(String title, int uid, int share) throws Exception{
        String query = "insert into Lessons values('" + title + "', " + uid + ", " + share + ")";
        int row = new DBContext().getConnection().prepareStatement(query).executeUpdate();
        if(row > 0) return true;
        else return false;
    }

    public Lesson getLesson(int lid) throws Exception {
        String query = "select * from Lessons where lid = " + lid;
        ResultSet rs = new DBContext().getConnection().prepareStatement(query).executeQuery();
        while (rs.next()) {
            int id = rs.getInt("lid");
            String title = rs.getString("title");
            int uid = rs.getInt("uid");
            int share = rs.getInt("share");
            rs.close();
            return new Lesson(id, title, uid, share);
        }
        return null;
    }
    
    public boolean updateLesson(int lid, String title, int uid, int share) throws Exception{
        String query = "update Lessons set ";
        int k = 0;
        if(title != null) {
            query += "title = '" + title + "'";
            k++;
        }
        if(uid != -1) {
            if(k > 0) query += ", ";
            query += " uid = " + uid;
            k++;
        }
        if(share  != -1) {
            if(k > 0) query += ", ";
            query += "share = " + share;
        }
        query += " where lid = " + lid;
        int row = new DBContext().getConnection().prepareStatement(query).executeUpdate();
        if(row > 0) return true;
        else return false;
    }
    
    public boolean deleteLesson(int lid) throws Exception{
        String query = "delete from Lessons where lid = " + lid;
        int row = new DBContext().getConnection().createStatement().executeUpdate(query);
        if(row > 0) return true;
        else return false;
    }
    
}
