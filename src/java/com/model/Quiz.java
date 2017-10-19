/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TuanManh
 */
public class Quiz {

    private int qid, lid;
    private String question, answer;

    public Quiz() {
    }

    public Quiz(int qid, int lid, String question, String answer) {
        this.qid = qid;
        this.lid = lid;
        this.question = question;
        this.answer = answer;
    }

    public Quiz(String question, String answer, int lid) {
        this.question = question;
        this.answer = answer;
        this.lid = lid;
    }

    public static Quiz getQuiz(int qid) throws Exception {

        String query = "select * from Quiz where qid = " + qid;
        Connection conn = new DBContext().getConnection();
        ResultSet rs = conn.prepareStatement(query).executeQuery();
        while (rs.next()) {
            int lid = rs.getInt("lid");
            String question = rs.getString("question");
            String answer = rs.getString("answer");
            int id = rs.getInt("qid");
            if (id == qid) {
                return new Quiz(question, answer, lid);
            }

        }
        return null;
    }
    
    public static Quiz createQuiz(String question, String anwser, int lid) throws Exception{
        String query = "insert into Quiz values (N'"+question+"', N'"+anwser+"',"+lid+")";
         Connection conn = new DBContext().getConnection();
         ResultSet rs = conn.prepareStatement(query).executeQuery();
          while (rs.next()) {
               String ques = rs.getString("question");
               String answer = rs.getString("answer");
               int id = rs.getInt("lid");
               return new Quiz(question, answer, lid);
          }
          return  null;
    }

    @Override
    public String toString() {
        return "Quiz{" + "qid=" + qid + ", lid=" + lid + ", question=" + question + ", answer=" + answer + '}';
    }

}
