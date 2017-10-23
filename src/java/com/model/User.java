
package com.model;

import com.util.Hash;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class User {
    private int id;
    private String username;
    private String password;
    private int permission;

    public User() {
    }

    public User(int id, String username, String password, int permission) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.permission = permission;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }
    
    public static int createUser(String username, String password, int permission) throws Exception{
        password = Hash.Sha256(password);
        String query = "insert into Users values(?, ?, ?)";
        PreparedStatement ps = new DBContext().getConnection().prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setInt(3, permission);
        ps.executeUpdate();
        
        ResultSet rs = ps.getGeneratedKeys();
        while (rs.next()) {
            int id = rs.getInt(1);
            return id;
        }
        return -1;
    }
    
    public static User login(String username, String password) throws Exception{     
        String query = "select * from Users";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(query).executeQuery();
        String hashPassword = Hash.Sha256(password);
        while (rs.next()) {
            int id = rs.getInt("uid");
            String name = rs.getString("username");
            String pass = rs.getString("password");
            int permission = rs.getInt("permission");
            if(name.equals(username) && pass.equals(hashPassword)){
                return new User(id, name, pass, permission);
            }
        }
        rs.close();
        conn.close();
        return null;
    }
    
    public  boolean isAdmin() throws Exception{     
        if(permission == 1){
            return true;
        }else{
            return false;
        } 
    }
    
    public static String getUser(int uid) throws Exception{
        String query = "select * from Users where uid = " + uid;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(query).executeQuery();
        while (rs.next()) {
            String user = rs.getString("username");
            return user;
        }
        rs.close();
        conn.close();
        return "Not found";
    }
    
    public static int getIdUser(String username) throws Exception{
        String query = "select * from Users where username like '" + username+"'";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(query).executeQuery();
        while (rs.next()) {
            int id = rs.getInt("uid");
            return id;
        }
        rs.close();
        conn.close();
        return -1;
    }
    
   public static boolean changePassword(int uid, String oldPassword, String newPassword) throws Exception{
        String query = "select * from Users where uid = " + uid;
        oldPassword = Hash.Sha256(oldPassword);
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(query).executeQuery();
        while (rs.next()) {
            String password = rs.getString("password");          
            if(password.equals(oldPassword)){
                updatePassword(newPassword, uid);
                return true;
            }
        }
        rs.close();
        conn.close();
        return false;
   }
   public static boolean updatePassword(String newPassword, int uid) throws Exception{
        newPassword = Hash.Sha256(newPassword);
        String query = "update Users set ";
        if(newPassword  != null) {
            query += "password = '" + newPassword + "'";
        }
        query += " where uid = " + uid;
        int row = new DBContext().getConnection().prepareStatement(query).executeUpdate();
        if(row > 0) return true;
        else return false;
   }
   public static boolean updateUser(int uid, String password, int permission) throws Exception{
        password = Hash.Sha256(password);
        if(password != null) {
            updatePassword(password, uid);
        }else{
            return false;
        }
        String query = "update Users set ";
        if(permission  != -1) {
            query += "permission = " + permission;
        }else{
            return false;
        }
        query += " where uid = " + uid;
        int row = new DBContext().getConnection().prepareStatement(query).executeUpdate();
        if(row > 0) return true;
        else return false;
   }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", password=" + password + ", permission=" + permission + '}';
    }
   
   
}
