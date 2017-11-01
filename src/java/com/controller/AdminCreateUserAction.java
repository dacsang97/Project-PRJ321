/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.User;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
    
public class AdminCreateUserAction extends ActionSupport {
    String newPass, rePass, username;
    int state;
    Map session;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
    
    public String getNewPass() {
        return newPass;
    }

    public void setNewPass(String newPass) {
        this.newPass = newPass;
    }

    public String getRePass() {
        return rePass;
    }

    public void setRePass(String rePass) {
        this.rePass = rePass;
    }
            
    public AdminCreateUserAction() {
        session = (Map) ActionContext.getContext().get("session");
    }
    
    public String execute() throws Exception {
        session = (Map) ActionContext.getContext().get("session");
        if(!newPass.equals(rePass)){
            return ERROR;
        }
        System.out.println(newPass);
        System.out.println(rePass);
        User.createUser(username, newPass, state);
        return SUCCESS;
    }   
}
