/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Folder;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author USER
 */
public class DeleteFolderAction extends ActionSupport {
    
    private int fid;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }
    
    public DeleteFolderAction() {
    }
    
    public String execute() throws Exception {
        boolean b = Folder.DeleteFolder(fid);
        if(b) return SUCCESS;
        else return ERROR;
    }
    
}
