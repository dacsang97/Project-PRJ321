
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
    
    public boolean isLogin(String username, String password) throws Exception{     
        String query = "select * from Users";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(query).executeQuery();
        while (rs.next()) {
            String user = rs.getString("username");
            String pass = rs.getString("password");
            if(user.equals(username) && pass.equals(password)){
                return true;
            }
        }
        rs.close();
        conn.close();
        return false;
    }
    
    public boolean isAdmin() throws Exception{     
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
    
   public boolean changePassword(int uid, String oldPassword, String newPassword) throws Exception{
       String query = "select * from Users where uid = " + uid;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(query).executeQuery();
        while (rs.next()) {
            String password = rs.getString("password");          
            if(password.equals(oldPassword)){
                String query1 = "update Users set password = ? where uid = ?";
                PreparedStatement ps = new DBContext().getConnection().prepareStatement(query1);
                ps.setString(1, newPassword);
                ps.setInt(2, uid);
                ps.executeUpdate();
                return true;
            }
        }
        rs.close();
        conn.close();
        return false;
   }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", password=" + password + ", permission=" + permission + '}';
    }
   
   
}
