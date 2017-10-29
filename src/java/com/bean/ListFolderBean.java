/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.model.Folder;
import com.model.Lesson;
import com.model.User;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TuanManh
 */
public class ListFolderBean {

    private User user;
    private int page, pageSize;
    int size;

    public ListFolderBean() {
        page = 0;
        pageSize = 0;
    }

    public ListFolderBean(User user) {
        this.user = user;
        this.page = page;
        this.pageSize = pageSize;
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

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getTotalPage() throws Exception {
        if (size % pageSize == 0) {
            return size / pageSize;
        } else {
            return 1 + size / pageSize;
        }
    }
    
    public List<Folder> getListAllFolder() throws Exception {
        List<Folder> list = new ArrayList<>();
        if (user == null) {
            list = Folder.getListFolder(null, -1, 3);

        } else if (user.isAdmin()) {
            list = Folder.getListFolder(null, -1, -1);
        } else {

            List<Folder> f1 = Folder.getListFolder(null, -1, 3);
            List<Folder> f2 = Folder.getListFolder(null, -1, 2);
            List<Folder> f3 = Folder.getListFolder(user.getUsername(), user.getId(), 1);

            list.addAll(f1);
            list.addAll(f2);
            list.addAll(f3);
            return list;

        }
        return list;
    }

    public List<Folder> getListfolder() throws Exception {
        List<Folder> list = new ArrayList<>();

        if (page == 0) {
            page = 1;
        }
        if (pageSize == 0) {
            pageSize = 5;
        }
        int from = (page - 1) * pageSize;
        int to = page * pageSize;

        if (user == null) {
            list = Folder.getListFolder(null, -1, 3);

        } else if (user.isAdmin()) {
            list = Folder.getListFolder(null, -1, -1);
        } else {

            List<Folder> f1 = Folder.getListFolder(null, -1, 3);
            List<Folder> f2 = Folder.getListFolder(null, -1, 2);
            List<Folder> f3 = Folder.getListFolder(user.getUsername(), user.getId(), 1);

            list.addAll(f1);
            list.addAll(f2);
            list.addAll(f3);
            return list;

        }
        size = list.size();
        if (to >= size) {
            to = size;
        }
        return list.subList(from, to);
    }

}
