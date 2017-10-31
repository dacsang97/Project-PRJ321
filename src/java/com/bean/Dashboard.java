/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bean;

import com.model.Folder;
import com.model.Lesson;
import com.model.Quiz;
import com.model.User;
import java.util.List;

/**
 *
 * @author Luxury
 */
public class Dashboard {
    public Dashboard() {
    }

    public int getUserCount() throws Exception {
        List<User> list = User.getListUser();
        return list.size();
    }
    
    public int getFolderCount() throws Exception {
        List<Folder> list = Folder.getListFolder(null, -1, -1);
        return list.size();
    }
    
    public int getLessonCount() throws Exception {
        List<Lesson> list = Lesson.getListLesson(-1, null, -1, -1);
        return list.size();
    }
    
    public int getQuizCount() throws Exception {
        return Quiz.getCountQuiz();
    }
    
}
