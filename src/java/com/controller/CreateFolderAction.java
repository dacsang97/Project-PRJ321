/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.google.gson.Gson;
import com.model.Folder;
import com.model.Lesson;
import com.model.User;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletResponseAware;

/**
 *
 * @author TuanManh
 */
public class CreateFolderAction extends ActionSupport implements
        ServletResponseAware{
    private String name;
    private int sharefolder;
    private String lessonsTemp;
    Map session;
    private HttpServletResponse response;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSharefolder() {
        return sharefolder;
    }

    public void setSharefolder(int sharefolder) {
        this.sharefolder = sharefolder;
    }

    public String getLessonsTemp() {
        return lessonsTemp;
    }

    public void setLessonsTemp(String lessonsTemp) {
        this.lessonsTemp = lessonsTemp;
    }
    
    public Map getSession() {
        return session;
    }

    public void setSession(Map session) {
        this.session = session;
    }
    
    public CreateFolderAction() {
        session = (Map) ActionContext.getContext().get("session");
    }
    
    public String execute() throws Exception {
        session = (Map) ActionContext.getContext().get("session");
        User u = (User)session.get("user");
        
        Gson gson = new Gson();
        Lesson[] lessons = gson.fromJson(lessonsTemp, Lesson[].class);
        int fid = Folder.createFolder(name, u.getId(), sharefolder);
        if (fid == -1) {
            session.put("CreateStatus", "FAIL");

            return ERROR;
        }
        Folder.deleteLesson(sharefolder);
        Folder.addLessonToFolder(fid, lessons);
        response.setHeader("fid", ""+fid);

        return SUCCESS;

    }
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    public HttpServletResponse getServletResponse() {
        return response;
    }
}
