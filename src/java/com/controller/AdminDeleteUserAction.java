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

/**
 *
 * @author Luxury
 */
public class AdminDeleteUserAction extends ActionSupport {
    int uid;
    Map session;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    } 
    
    public AdminDeleteUserAction() {
        session = (Map) ActionContext.getContext().get("session");
    }
    
    public String execute() throws Exception {
        User.deleteUser(uid);
        return SUCCESS;
    }
    
}
