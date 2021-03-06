package com.bean;


import com.model.Lesson;
import com.model.User;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author USER
 */
public class LessonBean {
    private int page, pageSize;
    private User user;
    int size;

    public LessonBean() {
        page = 0;
        pageSize = 0;
    }

    public LessonBean(int page, int pageSize, User user) {
        this.page = page;
        this.pageSize = pageSize;
        this.user = user;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getSize() {
        return size;
    }
    
    public int getTotalPage() throws Exception {
        if(size % pageSize == 0) return size / pageSize;
        else return 1 + size / pageSize;
    }
    
    public List<Lesson> getAllLessons() throws Exception {
        List<Lesson> lessons = new ArrayList<>();
        
    
        if(user == null) {
            lessons = Lesson.getListLesson(-1, null, -1, 3);
        }
        else if(user.isAdmin()) {
            lessons = Lesson.getListLesson(-1, null, -1, -1);
        }
        else {
            List<Lesson> l1 = Lesson.getListLesson(-1, null, -1, 3);
            List<Lesson> l2 = Lesson.getListLesson(-1, null, -1, 2);
            List<Lesson> l3 = Lesson.getListLesson(-1, null, user.getId(), 1);
            lessons.addAll(l1);
            lessons.addAll(l2);
            lessons.addAll(l3);
        }
        return lessons;
    }
    
    public List<Lesson> getMyLesson() throws Exception {
        List<Lesson> lessons = new ArrayList<>();
        lessons = Lesson.getListLesson(-1, null, user.getId(), -1);
        return lessons;
    }
    
    public List<Lesson> getLessons() throws Exception{
        if(page == 0) page = 1;
        if(pageSize == 0) pageSize = 5;
        int from = (page - 1) * pageSize;
        int to = page * pageSize;
        List<Lesson> lessons = new ArrayList<>();
        
    
        if(user == null) {
            lessons = Lesson.getListLesson(-1, null, -1, 3);
        }
        else if(user.isAdmin()) {
            lessons = Lesson.getListLesson(-1, null, -1, -1);
        }
        else {
            List<Lesson> l1 = Lesson.getListLesson(-1, null, -1, 3);
            List<Lesson> l2 = Lesson.getListLesson(-1, null, -1, 2);
            List<Lesson> l3 = Lesson.getListLesson(-1, null, user.getId(), 1);
            lessons.addAll(l1);
            lessons.addAll(l2);
            lessons.addAll(l3);
        }
        size = lessons.size();
        if(to >= size) to = size;
        return lessons.subList(from, to);
    }
}
