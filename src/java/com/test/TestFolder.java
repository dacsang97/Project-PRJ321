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
//    public void testGetFolder() throws Exception {
//         Folder folder = new Folder(1,"na", 1);
//
//        assertEquals(folder.toString(), Folder.getFolder(1).toString());
//           int fid = 1;
//           assertEquals("1 Progetest1 3", Folder.getFolder(fid).toString());
//    }
//    
    
//    public void testCreateFolder() throws Exception{
//     String name = "mahaza";
//     int uid = 1;
//     int sharefolder = 2;
//        
//        assertEquals("Create fail.", true,Folder.createFolder(name, sharefolder,uid));
//    }
//    
//     public void testDeleteFolder() throws Exception {
//        assertEquals(true, Folder.DeleteFolder(4));
//    }
//    
//    public void testDeleteFolderFalse() throws Exception {
//        assertEquals(false,Folder.DeleteFolder(4));
//    }
    
    public void testGetListFolder() throws Exception{
        assertEquals(2, Folder.getListFolder(null, 2, 3).size());
    }
    
    
      //uid = -1
     public void testgetListFolderu() throws Exception {
        assertEquals(7,Folder.getListFolder("mahaza", 2, 1).size());
    }
     
     //name = null and uid = -1
    public void testgetListLessontu() throws Exception {
        assertEquals(2, Folder.getListFolder(null, 2, 3).size());
    }
    
     //name = null and share = -1
    public void testgetListFolders() throws Exception {
        assertEquals(3, Folder.getListFolder(null, 3, 1).size());
    }
    // uid = -1 share = -1
    public void testgetListLessonus() throws Exception {
        assertEquals(1, Folder.getListFolder("Tiếng Anh", 2, 2).size());
    }
    
    
    public static void main(String[] args) {
        junit.textui.TestRunner.run(new TestSuite(TestFolder.class));
    }
}
