/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

    public static boolean createLesson(String title, int uid, int share) throws Exception{
        String query = "insert into Lessons values(?, ?, ?)";
        PreparedStatement ps = new DBContext().getConnection().prepareStatement(query);
        ps.setString(1, title);
        ps.setInt(2, uid);
        ps.setInt(3, share);
        int row = ps.executeUpdate();
        if(row > 0) return true;
        else return false;
    }

    public static Lesson getLesson(int lid) throws Exception {
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
    
    public static boolean updateLesson(int lid, String title, int uid, int share) throws Exception{
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
    
    public static boolean deleteLesson(int lid) throws Exception{
        String query = "delete from Lessons where lid = " + lid;
        int row = new DBContext().getConnection().createStatement().executeUpdate(query);
        if(row > 0) return true;
        else return false;
    }
    //name == null, get all lesson where uid == uid and share == share
    public static List<Lesson> getListLesson(String title, int uid, int share) throws Exception{
        List<Lesson> l = new ArrayList<>();
        String query = "select * from Lessons";
        int k = 0;
        if(title != null) {
            if(k == 0) query += " where ";
            query += "title = '" + title + "'";
            k++;
        }
        if(uid != -1) {
            if(k == 0) query += " where ";
            else if(k > 0) query += " and ";
            query += "uid = " + uid;
            k++;
        }
        if(share  != -1) {
            if(k == 0) query += " where ";
            else if(k > 0) query += " and ";
            query += "share = " + share;
        }
        ResultSet rs = new DBContext().getConnection().prepareStatement(query).executeQuery();
        while (rs.next()) {
            int lid = rs.getInt("lid");
            String titlee = rs.getString("title");
            int uidd = rs.getInt("uid");
            int sharee = rs.getInt("share");
            l.add(new Lesson(lid, titlee, uidd, sharee));
        }
        rs.close();
        return l;
    }
    
    
    
    @Override
    public String toString() {
        return lid + " " + title + " " + uid + " " + share;
    }
    
    
}
