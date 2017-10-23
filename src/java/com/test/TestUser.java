package com.test;

import com.model.User;
import com.util.Faker;
import com.util.Hash;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class TestUser extends TestCase {
    public void testLogin() throws Exception {      
        String name = "admin";
        String pass1 = Hash.Sha256("123456");
        String pass = "123456";
        int permission = 1;
        assertEquals("Login fail.", new User(1, name, pass1, permission).toString(), User.login(name, pass).toString());
    }
    
    public void testCreateUser() throws Exception{
       String username = Faker.randomString(8);
       int id = User.createUser(username, "123456", 2);
       User user = new User(id, username, "123456", 2);
       int i = User.getIdUser(username);
       assertEquals(i,id);
    }
    public void testUpdateUser() throws Exception{
        int id = 3;
        String password = "12345678";
        int permission = 3;
        assertEquals(true, User.updateUser(id, password, permission));
    }
    public void testGetIdUser() throws Exception{
        int id = 3; 
        assertEquals(id, User.getIdUser("phongpv"));
    }

    public void testGetUser() throws Exception {
        int id = 1;
        String username = "admin";
        String pass = Hash.Sha256("123456");
        int permiss = 1;
        User user = new User(id, username, pass, permiss);
        assertEquals(user.toString(), User.getUser(1).toString());
    }
//    public void testChangePassword() throws Exception{
//        int uid = 5;
//        String oldPass = "123456";
//        String newPass = "1234566";
//        assertEquals(true, User.changePassword(uid, oldPass, newPass));
//    }
    
    public void testGetUserNotFound() throws Exception {
        assertEquals(null, User.getUser(10));
    }

    public static void main(String[] args) {
        junit.textui.TestRunner.run(new TestSuite(TestUser.class));
    }
}
