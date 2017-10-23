package com.test;

import com.model.User;
import com.util.Faker;
import com.util.Hash;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class TestUser extends TestCase {
    User a = new User();
    public void testLogin() throws Exception {      
        String name = "admin";
        String pass = Hash.Sha256("1234568");
        assertEquals("Login fail.", true, a.isLogin(name, pass));
    }
    
    public void testCreateUser() throws Exception{
       String username = Faker.randomString(8);
       int id = User.createUser(username, Hash.Sha256("123456"), 2);
       User user = new User(id, username, Hash.Sha256("123456"), 2);
       int i = User.getIdUser(username);
       assertEquals(i,id);
    }
    public void testUpdateUser() throws Exception{
        int id = 3;
        String password = Hash.Sha256("12345678");
        int permission = 3;
        assertEquals(true, a.updateUser(id, password, permission));
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
        int uid = 4;
        String oldPass = Hash.Sha256("123456");
        String newPass = Hash.Sha256("123456");
        assertEquals(true, a.changePassword(uid, oldPass, newPass));
    }
    
    public void testGetUserNotFound() throws Exception {
        assertEquals("Not found", User.getUser(10));
    }

    public static void main(String[] args) {
        junit.textui.TestRunner.run(new TestSuite(TestUser.class));
    }
}
