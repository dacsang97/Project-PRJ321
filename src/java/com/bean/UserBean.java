
package com.bean;

import com.model.DBContext;
import com.model.Lesson;
import com.model.User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserBean {
    String name;
    int page, pageSize, size;
    public UserBean() {
        page = 0;
        pageSize = 5;
        name = null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
    public int getTotalPage() throws Exception {
        return 1 + size / pageSize;
    }
    
    public List<User> getAllUsers() throws Exception {
        return User.getListUser();
    }
    
    public List<User> getUsers() throws Exception{
        if (page == 0) {
            page = 1;
        }
        if (pageSize == 0) {
            pageSize = 5;
        }
        int from = (page - 1) * pageSize + 1;
        int to = page * pageSize;
        List<User> list = User.getListUser();
        List<User> user = new ArrayList<>();
        String query = "{call GetUsers(?,?)}";
        Connection conn = new DBContext().getConnection();
        CallableStatement cs = conn.prepareCall(query);
        cs.setInt(1, from);
        cs.setInt(2, to);
        ResultSet rs = cs.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("uid");
            String username = rs.getString("username");
            String pass = rs.getString("password");
            int permission = rs.getInt("permission");
            user.add(new User(id, username, pass, permission));
        }
        rs.close();
        conn.close();
        size = list.size();
        return user;
    }
}
