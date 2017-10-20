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
    public static void main(String[] args) {
        junit.textui.TestRunner.run(new TestSuite(TestLesson.class));
    }
}
