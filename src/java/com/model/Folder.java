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
 * @author TuanManh
 */
public class Folder {
    private int fid, uid,sharefolder;
    private String name;
  

    public Folder() {
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getSharefolder() {
        return sharefolder;
    }

    public void setSharefolder(int sharefolder) {
        this.sharefolder = sharefolder;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    

    public Folder(int fid, int uid, String name,int sharefolder) {
        this.fid = fid;
        this.uid = uid;
        this.name = name;
        this.sharefolder = sharefolder;
    }

    public Folder(int uid, String name, int sharefolder) {
        this.uid = uid;
        this.name = name;
        this.sharefolder = sharefolder;
    }
    
     public static Folder getFolder(int fid) throws Exception {

        String query = "select * from Folders where fid = " + fid;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(query).executeQuery();
        while (rs.next()) {
            int uid = rs.getInt("uid");
            String name = rs.getString("name");
            int sharefolder = rs.getInt("sharefolder");
            int id = rs.getInt("fid");
            if (id == fid) {
                return new Folder(uid, name, sharefolder);
            }

        }
        return null;
    }
     
     
        public static boolean createFolder(String name, int uid, int sharefolder) throws Exception {
        String query = "insert into Folders values (?, ?, ?)";
        PreparedStatement ps = new DBContext().getConnection().prepareStatement(query);
        ps.setString(1, name);
        ps.setInt(2, uid);
        ps.setInt(3, sharefolder);
        int row = ps.executeUpdate();
        if (row > 0) {
            return true;
        } else {
            return false;
        }
    }
        
        public static boolean DeleteFolder(int fid) throws Exception {

        String query = "delete from Folders where fid = " + fid;
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = new DBContext().getConnection().prepareStatement(query);
        int row = ps.executeUpdate();
        if (row > 0) {
            return true;
        } else {
            return false;
        }

    }
        
        public static List<Folder> getListFolder( String name, int uid, int sharefolder) throws Exception{
              List<Folder> f = new ArrayList<>();
              String query = "select * from Folders";
               int k = 0;
                if(name != null) {
                    if(k == 0) query += " where ";
                    query += "name = '" + name + "'";
                    k++;
                }
              
                if(uid != -1) {
                    if(k == 0) query += " where ";
                    else if(k > 0) query += " and ";
                    query += "uid = " + uid;
                    k++;
                }
                 
                if(sharefolder  != -1) {
                    if(k == 0) query += " where ";
                    else if(k > 0) query += " and ";
                    query += "sharefolder = " + sharefolder;
                } 
                
                ResultSet rs = new DBContext().getConnection().prepareStatement(query).executeQuery();
                    while (rs.next()) {
                        int fid = rs.getInt("fid");
                        String names = rs.getString("name");
                        int uids = rs.getInt("uid");
                        int sharefoldes = rs.getInt("sharefolder");
                        f.add(new Folder(fid, uids, names, sharefoldes));
                    }
               return f;
        }
        
        public static boolean getCountFolder(int uid) throws Exception{
            String query = "select count(*) from Folders";
//            ResultSet rs = new DBContext().getConnection().prepareStatement(query).executeQuery();
//            int k = 0;
            if(uid != -1){
//                if(k == 0) query += " where ";
//                    else if(k > 0) query += " and ";
//                    query += "uid = " + uid;
//                    k++;

            query += "where uid = " +uid;
            }
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = new DBContext().getConnection().prepareStatement(query);
        int row = ps.executeUpdate();
        if (row > 0) {
            return true;
        } else {
            return false;
        }
        }
}
