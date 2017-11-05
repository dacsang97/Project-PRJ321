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
import org.apache.struts2.interceptor.ServletResponseAware;

/**
 *
 * @author USER
 */
public class EditFolderAction extends ActionSupport implements
        ServletResponseAware{
    private HttpServletResponse response;
    private int fid, shareFolder;
    private String lessonsTemp;
    Map session;
    private String name;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }
    public int getShareFolder() {
        return shareFolder;
    }

    public void setShareFolder(int shareFolder) {
        this.shareFolder = shareFolder;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getLessonsTemp() {
        return lessonsTemp;
    }

    public void setLessonsTemp(String lessonsTemp) {
        this.lessonsTemp = lessonsTemp;
    }

    public EditFolderAction() {
    }
    
    public String execute() throws Exception {
        session = (Map) ActionContext.getContext().get("session");
        User u = (User)session.get("user");
        
        Gson gson = new Gson();
        Lesson[] lessons = gson.fromJson(lessonsTemp, Lesson[].class);
        Folder.updateFolder(fid, name, shareFolder);
        Folder.deleteLesson(fid);
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
