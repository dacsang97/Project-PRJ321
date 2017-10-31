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
    
public class AdminEditUserAction extends ActionSupport {
    String newPass, rePass;
    int uid;
    Map session;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
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
    public AdminEditUserAction() {
        session = (Map) ActionContext.getContext().get("session");
    }
    
    public String execute() throws Exception {
        session = (Map) ActionContext.getContext().get("session");
        if(!newPass.equals(rePass)){
            return ERROR;
        }
        session = (Map) ActionContext.getContext().get("session");
        //User user = User.getUser(uid);
        boolean change = User.updatePassword(newPass, uid);    
        if(change == true) {          
            return SUCCESS;
        } 
          return ERROR;
    }
    
}
