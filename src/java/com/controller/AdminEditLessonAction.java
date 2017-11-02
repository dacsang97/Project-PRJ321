/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Lesson;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

/**
 *
 * @author USER
 */
public class AdminEditLessonAction extends ActionSupport {
    
    private int lid;
    private String title;
    private int share;
    
    public AdminEditLessonAction() {
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
        boolean b = Lesson.updateLesson(lid, title, -1, share);
        if(b) return SUCCESS;
        else return ERROR;
    }
    
}
