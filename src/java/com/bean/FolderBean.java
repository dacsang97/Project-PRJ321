
package com.bean;

import com.model.Lesson;
import com.model.User;
import java.util.ArrayList;
import java.util.List;


public class FolderBean {
    int fid, uid, sharefolder;
    String name;
    public FolderBean() {
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
    
    public List<Lesson> getLesson() throws Exception{
        if (uid <= 0) {
            return Lesson.getListLesson(fid,null,-1, 3);
        }
        System.out.println(uid);
        User u = User.getUser(uid);
        if (u.isAdmin()) {
            return Lesson.getListLesson(fid, null, -1, -1);
        }
        List<Lesson> list = new ArrayList<>();
        
        // Lesson public
        List<Lesson> type3 = Lesson.getListLesson(fid, null, -1, 3);
        
        // Lesson for member
        List<Lesson> type2 = Lesson.getListLesson(fid, null, -1, 2);
        
        // Lesson only for uid
        List<Lesson> type1 = Lesson.getListLesson(fid, null, uid, 1);
        
        list.addAll(type1);
        list.addAll(type2);
        list.addAll(type3);
        return list;
    }
    
}
