/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Lesson;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author USER
 */
public class DeleteLessonAction extends ActionSupport {
    
    private int lid;

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }
    
    public DeleteLessonAction() {
    }
    
    public String execute() throws Exception {
        boolean b = Lesson.deleteLesson(lid);
        if(b) return SUCCESS;
        else return ERROR;
    }
    
}
