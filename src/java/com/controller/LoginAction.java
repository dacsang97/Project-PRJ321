/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class LoginAction extends ActionSupport {
    
    String name, password;
    Map session;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public LoginAction() {
    }
    
    public String execute() throws Exception {
        User user = User.login(name, password);
        System.out.println(user.getUsername());
        if(user != null) {
            session = (Map) ActionContext.getContext().get("session");
            session.put("user", user);
            session.put("LoginError", "");
            return SUCCESS;
        } 
        return ERROR;
    }

    public void setSession(Map session) {
        this.session = session;
    }
    
    
    
    public String logout() {
        session = (Map) ActionContext.getContext().get("session");
        session.remove("user");
        return SUCCESS;
    }
}
