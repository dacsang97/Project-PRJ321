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
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletResponseAware;

/**
 *
 * @author USER
 */
public class CreateLessonAction extends ActionSupport implements
        ServletResponseAware {

    private String title;
    private int share;
    private String quizzesTemp;
    Map session;
    private HttpServletResponse response;

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

    public String getQuizzesTemp() {
        return quizzesTemp;
    }

    public void setQuizzesTemp(String quizzesTemp) {
        this.quizzesTemp = quizzesTemp;
    }

    public CreateLessonAction() {
        session = (Map) ActionContext.getContext().get("session");
    }

    public String execute() throws Exception {
        session = (Map) ActionContext.getContext().get("session");
        User u = (User) session.get("user");
        Gson gson = new Gson();
        Quiz[] quizzes = gson.fromJson(quizzesTemp, Quiz[].class);
        int lid = Lesson.createLesson(title, u.getId(), share);
        if (lid == -1) {
            session.put("CreateStatus", "FAIL");

            return ERROR;
        }

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
