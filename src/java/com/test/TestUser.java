package com.test;

import com.model.User;
import com.util.Hash;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class TestUser extends TestCase {
    User a = new User();
    public void testLogin() throws Exception {      
        String name = "admin";
        String pass = Hash.Sha256("1234567");
        assertEquals("Login fail.", true, a.isLogin(name, pass));
    }
    
    public void testCreateUser() throws Exception{
       String name = "phong99";
       String pass = Hash.Sha256("123456");
       int permission = 2;
       assertEquals(true, a.createUser(name, pass,permission));
    }
    
    public void testGetIdUser() throws Exception{
        int id = 3; 
        assertEquals(id, User.getIdUser("phongpv"));
    }

    public void testGetUser() throws Exception {
        String username = "admin";    
        assertEquals(username, User.getUser(1));
    }
    public void testChangePassword() throws Exception{
        int uid = 1;
        String oldPass = Hash.Sha256("123456");
        String newPass = Hash.Sha256("1234567");
        assertEquals(true, a.changePassword(uid, oldPass, newPass));
    }
    
    public void testGetUserNotFound() throws Exception {
        assertEquals("Not found", User.getUser(10));
    }

    public static void main(String[] args) {
        junit.textui.TestRunner.run(new TestSuite(TestUser.class));
    }
}
