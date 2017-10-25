
package com.bean;

import com.model.DBContext;
import com.model.Lesson;
import com.model.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class FolderBean {
    int fid, uid, sharefolder;
    String name;
    int page, pageSize, size;
    List<Lesson> list = new ArrayList<>();;
    public FolderBean() {
        page = 0;
        pageSize = 5;
        fid = uid = -1;
        sharefolder = 3;
        name = null;
        
    }

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getSharefolder() {
        return sharefolder;
    }

    public void setSharefolder(int sharefolder) {
        this.sharefolder = sharefolder;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
    
    public int getTotalPage() throws Exception{
        return 1 + size / pageSize;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getSize() {
        return size;
    }
    
    public List<Lesson> getLesson() throws Exception{
        if(page == 0) page = 1;
        if(pageSize == 0) pageSize = 5;
        int from = (page - 1) * pageSize + 1;
        int to = page * pageSize;     
        List<Lesson> list1 = new ArrayList<>();
        if (uid <= 0) {
            list.addAll(Lesson.getListLesson(fid,null,-1, 3));         
            for (int i = from; i < to; i++) {
                list1.add(list.get(i));
            }
            System.out.println(list1.size());
            size = list.size();
            return list1;
        }
        User u = User.getUser(uid);
        if (u.isAdmin()) {
            list.clear();
            list.addAll(Lesson.getListLesson(fid,null,-1, -1));    
            for (int i = from; i < to; i++) {
                list1.add(list.get(i));
            }
            System.out.println(list1.size());
            size = list.size();
            return list1;
        }
        
        
        // Lesson public
        List<Lesson> type3 = Lesson.getListLesson(fid, null, -1, 3);
        
        // Lesson for member
        List<Lesson> type2 = Lesson.getListLesson(fid, null, -1, 2);
        
        // Lesson only for uid
        List<Lesson> type1 = Lesson.getListLesson(fid, null, uid, 1);
        
        list.addAll(type1);
        list.addAll(type2);
        list.addAll(type3);
        for (int i = from; i < to; i++) {
            list1.add(list.get(i));
        }
        System.out.println(list1.size());
        size = list.size();
        return list1;
    }
    
}
