/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.google.gson.Gson;
import com.model.Lesson;
import com.model.Quiz;
import com.model.User;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletResponseAware;

/**
 *
 * @author USER
 */
public class EditLessonAction extends ActionSupport implements
        ServletResponseAware{
    
    private int lid;
    private String title;
    private int share;
    private String quizzesTemp;
    Map session;
    private HttpServletResponse response;
    
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
    
    public String getQuizzesTemp() {
        return quizzesTemp;
    }

    public void setQuizzesTemp(String quizzesTemp) {
        this.quizzesTemp = quizzesTemp;
    }
    
    public String execute() throws Exception {
       
        session = (Map) ActionContext.getContext().get("session");
        boolean b = Lesson.updateLesson(lid, title, -1, share);
        if (!b) return ERROR;
        User u = (User) session.get("user");
        Gson gson = new Gson();
        Quiz[] quizzes = gson.fromJson(quizzesTemp, Quiz[].class);
        
        // clear old quiz
        Lesson.deleteLessonQuiz(lid);
        
        // update and add new quiz
        for (Quiz q : quizzes) {
            if (!q.getQuestion().equals("") && !q.getAnswer().equals("")) {
                Quiz.createQuiz(q.getQuestion(), q.getAnswer(), lid);
            }
        }
        response.setHeader("lid", ""+lid);
        session.put("CreateStatus", "OK");
        return SUCCESS;
    }
    
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    public HttpServletResponse getServletResponse() {
        return response;
    }
}
