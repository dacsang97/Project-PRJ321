
package com.test;

import com.model.User;
import com.util.Hash;

public class test {
    public static void main(String[] args) throws Exception {
        User a = new User();
        
        String name = "admin";
        String pass = Hash.Sha256("123456");
        
        System.out.println(a.isLogin(name, pass));
        
        System.out.println(a.getUser(10));
    }
}
