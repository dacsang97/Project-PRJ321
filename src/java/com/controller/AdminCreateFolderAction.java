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

/**
 *
 * @author USER
 */
public class AdminCreateFolderAction extends ActionSupport {
    
    private String name;
    private int shareFolder;
    Map session;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getShareFolder() {
        return shareFolder;
    }

    public void setShareFolder(int shareFolder) {
        this.shareFolder = shareFolder;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }
    
    public AdminCreateFolderAction() {
        session = (Map) ActionContext.getContext().get("session");
    }
    
    public String execute() throws Exception {
        session = (Map) ActionContext.getContext().get("session");
        User u = (User)session.get("user");
//        boolean b = Folder.createFolder(name, u.getId(), shareFolder);
//        if(b) return SUCCESS;
//        else return ERROR;
        return SUCCESS;
    }
    
}
