/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Lesson;
import com.model.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class CreateLessonAction extends ActionSupport {
    
    private String title;
    private int  share;
    Map session;

//    public void setSession(Map session) {
//        this.session = session;
//    }

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
    
    public CreateLessonAction() {
        session = (Map) ActionContext.getContext().get("session");
    }
    
    public String execute() throws Exception {
        session = (Map) ActionContext.getContext().get("session");
        User u = (User) session.get("user");
        System.out.println(u.getUsername());
        boolean b = Lesson.createLesson(title, u.getId(), share);
        if(b) return SUCCESS;
        else return ERROR;
    }
    
}
