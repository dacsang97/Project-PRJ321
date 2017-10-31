/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Folder;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

/**
 *
 * @author TuanManh
 */
public class EditFolderAction extends ActionSupport{
    private int fid,sharefolder;
    private String name;
    Map session;
    public EditFolderAction() {
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public int getSharefolder() {
        return sharefolder;
    }

    public void setSharefolder(int sharefolder) {
        this.sharefolder = sharefolder;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }
    
    
    public String execute() throws Exception {
         session = (Map) ActionContext.getContext().get("session");
         boolean update = Folder.updateFolder(fid, name, sharefolder);
          if(update == true) {          
            return SUCCESS;
        } 
          return ERROR;
    }
    
}
