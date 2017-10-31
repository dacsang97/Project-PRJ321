/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Folder;
import com.model.User;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TuanManh
 */
public class CreateFolderAction extends ActionSupport{
    private String name;
    private int sharefolder;
    Map session;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSharefolder() {
        return sharefolder;
    }

    public void setSharefolder(int sharefolder) {
        this.sharefolder = sharefolder;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }
    
    
    public CreateFolderAction() {
    }
    
    public String execute() throws Exception {
         session = (Map) ActionContext.getContext().get("session");
         User u = (User) session.get("user");
         boolean create = Folder.createFolder(name, u.getId(),sharefolder);
         if(create == true) {          
            return SUCCESS;
        } 
          return ERROR;
        
    } 
}
