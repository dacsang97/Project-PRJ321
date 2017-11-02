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
 * @author TuanManh
 */
public class DeleteFolderAction extends ActionSupport {

    private int fid;
    Map session;
    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }
    public DeleteFolderAction() {
    }
    
    public String execute() throws Exception {
        boolean b = Folder.deleteFolder(fid);
        if(b) return SUCCESS;
        else return ERROR;
    }
}
