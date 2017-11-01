/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.model.Lesson;
import com.model.Quiz;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author USER
 */
public class QuizBean {
    private int lid;

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }
    
    public String getName() throws Exception {
        Lesson l = Lesson.getLesson(lid);
        if (l != null) {
            return l.getTitle();
        }
        return "";
    }
    
    public List<Quiz> getQuizs() throws Exception {
        List<Quiz> quizs = Quiz.getLessonQuiz(lid);
        return quizs;
    }
}
