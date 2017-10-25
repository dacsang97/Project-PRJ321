/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test;

import com.model.Lesson;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 *
 * @author USER
 */
public class TestLesson extends TestCase{
    Lesson l = new Lesson();
    
    public void testCreateLesson() throws Exception {
        assertEquals(true, l.createLesson("kaka", 3, 3));
    }
    
    //test ID existed
    public void testGetLesson() throws Exception {
        int lid = 1;
        assertEquals("1 Progetest1 2 3", l.getLesson(lid).toString());
    }
    
    //test ID does not existed
    public void testGetLesson1() throws Exception {
        int lid = 15;
        assertEquals(null, l.getLesson(lid));
    }
    
    public void testUpdateLesson() throws Exception {
        assertEquals(true, l.updateLesson(9, "hihi", -1, -1));
    }
    
    public void testDeleteLesson() throws Exception {
        assertEquals(false, l.deleteLesson(15));
    }
    //test getListLesson
    //title = null
//    public void testgetListLessont() throws Exception {
//        assertEquals(4, l.getListLesson(null, 2, 3).size());
//    }
//    //uid = -1
//    public void testgetListLessonu() throws Exception {
//        assertEquals(1, l.getListLesson("Progetest1", -1, 3).size());
//    }
//    //share = -1
//    public void testgetListLessons() throws Exception {
//        assertEquals(1, l.getListLesson("Progetest1", 2, -1).size());
//    }
//    //title = null and uid = -1
//    public void testgetListLessontu() throws Exception {
//        assertEquals(9, l.getListLesson(null, -1, 3).size());
//    }
//    //title = null and share = -1
//    public void testgetListLessontts() throws Exception {
//        assertEquals(4, l.getListLesson(null, 2, -1).size());
//    }
//    //uid = -1 and share = -1
//    public void testgetListLessonus() throws Exception {
//        assertEquals(1, l.getListLesson("Progetest1", -1, -1).size());
//    }
//    //title = null, uid = -1, share = -1 (no para)
//    public void testgetListLessonttus() throws Exception {
//        assertEquals(9, l.getListLesson(null, -1, -1).size());
//    }
//    //full para
//    public void testgetListLesson() throws Exception {
//        assertEquals(1, l.getListLesson("Progetest1", 2, 3).size());
//    }
    public void testgetCountLesson() throws Exception {
        assertEquals(10, l.getCountLesson(-1));
    }
    public static void main(String[] args) {
        junit.textui.TestRunner.run(new TestSuite(TestLesson.class));
    }
}
