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

/**
 *
 * @author PhongPham
 */
public class EditProfileAction extends ActionSupport {
    String oldPass, newPass, rePass;
    Map session;

    public String getOldPass() {
        return oldPass;
    }

    public void setOldPass(String oldPass) {
        this.oldPass = oldPass;
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
    
    
    
    public EditProfileAction() {
        session = (Map) ActionContext.getContext().get("session");
    }
    
    public String execute() throws Exception {
        session = (Map) ActionContext.getContext().get("session");
        System.out.println(((User)session.get("user")).getId());
        if(!newPass.equals(rePass)){
            return ERROR;
        }
        session = (Map) ActionContext.getContext().get("session");
        User user = (User)session.get("user");
        System.out.println(user.getId());
        boolean change = User.changePassword(user.getId(), oldPass, newPass);
        if(change == true) {          
            return SUCCESS;
        } 
          return ERROR;
    }
    
}
