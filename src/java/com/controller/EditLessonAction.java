/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Lesson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

/**
 *
 * @author USER
 */
public class EditLessonAction extends ActionSupport {
    
    private int lid;
    private String title;
    private int share;
    Map session;
    
    public EditLessonAction() {
        session = (Map) ActionContext.getContext().get("session");
    }

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getShare() {
        return share;
    }

    public void setShare(int share) {
        this.share = share;
    }
    
    public String execute() throws Exception {
        session = (Map) ActionContext.getContext().get("session");
        boolean b = Lesson.updateLesson(lid, title, -1, share);
        if(b) return SUCCESS;
        else return ERROR;
    }
    
}
