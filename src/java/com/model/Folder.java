/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TuanManh
 */
public class Folder {

//    public static void addAll(List<Folder> f1) {
//        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
    private int fid, uid, sharefolder;
    private String name;
    User author;

 
   
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

    public Folder(int fid, int uid, String name, int sharefolder) {
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
    
     public String getAuthor() throws Exception{
        author = User.getUser(uid);
        name = author.getUsername();
        return name;
   
        
     }
     
     
    public String getTypeShare(){
        switch(sharefolder){
            case 1:
                return "Chỉ mình tôi";
            case 2:
                return "Thành viên";
            case 3:
                return "Công khai";
            default:
                return null;
        }
    }

    public static int getIdFolder(int fid) throws Exception {
        String query = "select * from Folders where fid = " + fid;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(query).executeQuery();
        while (rs.next()) {
            int uid = rs.getInt("uid");
            return uid;
        }
        return -1;
    }
    
    public static String getFolderName(int fid) throws Exception {
        String query = "select * from Folders where fid = " + fid;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(query).executeQuery();
        while (rs.next()) {
            String name = rs.getString("name");
            return name;
        }
        return "";
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

    public static List<Folder> getListFolder(String name, int uid, int sharefolder) throws Exception {
        List<Folder> f = new ArrayList<>();
        String query = "select * from Folders";
        int k = 0;
        if (name != null) {
            if (k == 0) {
                query += " where ";
            }
            query += "name = '" + name + "'";
            k++;
        }

        if (uid != -1) {
            if (k == 0) {
                query += " where ";
            } else if (k > 0) {
                query += " and ";
            }
            query += "uid = " + uid;
            k++;
        }

        if (sharefolder != -1) {
            if (k == 0) {
                query += " where ";
            } else if (k > 0) {
                query += " and ";
            }
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

    public static boolean getCountFolder(int uid) throws Exception {
        String query = "select count(*) from Folders";
//            ResultSet rs = new DBContext().getConnection().prepareStatement(query).executeQuery();
//            int k = 0;
        if (uid != -1) {
//                if(k == 0) query += " where ";
//                    else if(k > 0) query += " and ";
//                    query += "uid = " + uid;
//                    k++;

            query += "where uid = " + uid;
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

    public static boolean updateFolder(int fid, String name, int sharefolder) throws Exception {
        String query = "update Folders set ";
        int k = 0;
        if (name != null) {
            query += "name = '" + name + "'";
          k++;  
        }
        if(sharefolder != 1){
            if(k > 0)
            query += ",";
            query += "sharefolder = '" + sharefolder + "'";
            k++;
        }
        query += " where fid = " + fid;
        int row = new DBContext().getConnection().prepareStatement(query).executeUpdate();
        if (row > 0) {
            return true;
        } else {
            return false;
        }
    }
    
     
    @Override
    public String toString() {
        return fid + " " + uid + " " + name + " " + sharefolder;
    }
}
