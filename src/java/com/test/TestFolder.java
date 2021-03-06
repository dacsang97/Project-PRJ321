/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test;

import com.model.Folder;
import com.model.Quiz;
import junit.framework.TestCase;
import static junit.framework.TestCase.assertEquals;
import junit.framework.TestSuite;

/**
 *
 * @author TuanManh
 */
public class TestFolder extends TestCase {
  
    
    public void testCreateFolder() throws Exception{
     String name = "uzi";
     int uid = 1;
     int sharefolder = 3;
        
        assertEquals("Create fail.", true,Folder.createFolder(name, uid, sharefolder));
    }
    
     public void testDeleteFolder() throws Exception {
        assertEquals(true, Folder.deleteFolder(4));
    }
    
    public void testDeleteFolderFalse() throws Exception {
        assertEquals(false,Folder.deleteFolder(1000));
    }
    
    public void testGetListFolder() throws Exception{
        assertEquals(2, Folder.getListFolder(null, 2, 3).size());
    }
    
    
      //uid = -1
     public void testgetListFolderu() throws Exception {
        assertEquals(7,Folder.getListFolder("mahaza", -1, 1).size());
    }
     
//     name = null and uid = -1
    public void testgetListLessontu() throws Exception {
        assertEquals(5, Folder.getListFolder(null, -1, 3).size());
    }
    
     //name = null and share = -1
    public void testgetListFolders() throws Exception {
        assertEquals(8, Folder.getListFolder(null, 3, -1).size());
    }
    // uid = -1 share = -1
    public void testgetListLessonus() throws Exception {
            assertEquals(7, Folder.getListFolder("mahaza", -1, -1).size());
    }
    
    //share = -1
    
    public void testgetListLessonss() throws Exception{
        assertEquals(1, Folder.getListFolder("uzi", 2, -1).size());
    }
    
     public void testUpdateFolder() throws Exception {
        assertEquals(true, Folder.updateFolder(21,"Ryu", 2));
    }
    
    
    public static void main(String[] args) {
        junit.textui.TestRunner.run(new TestSuite(TestFolder.class));
    }
}
