/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test;

import com.model.Quiz;
import com.model.User;
import junit.framework.TestCase;
import static junit.framework.TestCase.assertEquals;
import junit.framework.TestSuite;

/**
 *
 * @author TuanManh
 */
public class TestQuiz extends TestCase {
    Quiz a = new Quiz();
    public void testGetQuiz() throws Exception {
        Quiz quiz = new Quiz("na", "na", 1);

        assertEquals(quiz.toString(), Quiz.getQuiz(1).toString());
    }

    public void testQuizNotFound() throws Exception {
        Quiz quiz = new Quiz("na", "na", 1);

        assertEquals(null, Quiz.getQuiz(100));
    }
    
    public void testCreateQuiz() throws Exception{
      String quest = "á";
      String answer = "ớ";
      int id = 1;
        
         assertEquals("Create fail.", true, a.createQuiz(quest, answer,id));
        
    }

    public static void main(String[] args) {
        junit.textui.TestRunner.run(new TestSuite(TestQuiz.class));
    }
}
