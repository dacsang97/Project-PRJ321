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

    public ListFolderBean() {
    }

    public ListFolderBean(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
   public List<Folder> getListFolder() throws Exception{
            if(user == null){
                return Folder.getListFolder(null, -1, 3);

                 }
            else{
                List<Folder> list = new ArrayList<>();
                List<Folder> f1 = Folder.getListFolder(user.getUsername(), user.getId(), 3);
                List<Folder> f2 = Folder.getListFolder(user.getUsername(), user.getId(), 2);
                List<Folder> f3 = Folder.getListFolder(user.getUsername(), user.getId(), 1);
                
                list.addAll(f1);
                list.addAll(f2);
                list.addAll(f3);
                return list;
                
                
            }
            
   }
        
}
