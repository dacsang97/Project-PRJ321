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
public class AdminDeleteFolderAction extends ActionSupport {
    
    private int fid;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }
    
    public AdminDeleteFolderAction() {
    }
    
    public String execute() throws Exception {
        boolean b = Folder.DeleteFolder(fid);
        if(b) return SUCCESS;
        else return ERROR;
    }
    
}
