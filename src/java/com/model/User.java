
package com.model;

import java.sql.Connection;
import java.sql.ResultSet;
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
    
    
    public boolean isLogin(String username, String password) throws Exception{     
        String query = "select * from Users";
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(query).executeQuery();
        while (rs.next()) {
            String user = rs.getString("username");
            String pass = rs.getString("password");
            if(user.equals(username) && password.equals(password)){
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
    
    
}
