/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Folder;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author USER
 */
public class AdminEditFolderAction extends ActionSupport {
    
    private int fid, shareFolder;
    private String name;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public int getShareFolder() {
        return shareFolder;
    }

    public void setShareFolder(int shareFolder) {
        this.shareFolder = shareFolder;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
    public AdminEditFolderAction() {
    }
    
    public String execute() throws Exception {
        boolean b = Folder.updateFolder(fid, name, shareFolder);
        if(b) return SUCCESS;
        else return ERROR;
    }
    
}
