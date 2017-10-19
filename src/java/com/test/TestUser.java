package com.test;

import com.model.User;
import com.util.Hash;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class TestUser extends TestCase {
    User a = new User();
    public void testLogin() throws Exception {
        
        String name = "admin";
        String pass = Hash.Sha256("123456");
        assertEquals("Login fail.", true, a.isLogin(name, pass));
    }

    public void testGetUser() throws Exception {
        String username = "admin";
        
        assertEquals(username, User.getUser(1));
    }
    
    public void testGetUserNotFound() throws Exception {
        assertEquals("Not found", User.getUser(10));
    }

    public static void main(String[] args) {
        junit.textui.TestRunner.run(new TestSuite(TestUser.class));
    }
}
