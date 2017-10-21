/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
    
    public static boolean createQuiz(String question, String anwser, int lid) throws Exception{
        String query = "insert into Quiz values (?, ?, ?)";
        PreparedStatement ps = new DBContext().getConnection().prepareStatement(query);
        ps.setString(1, question);
        ps.setString(2, anwser);
        ps.setInt(3, lid);
        int row = ps.executeUpdate();
        if(row > 0) return true;
        else return false;
    }
    
    public boolean UpdateQuiz(int qid, String question, String answer) throws Exception{
         String query = "update Quiz set ";
//         PreparedStatement ps = new DBContext().getConnection().prepareStatement(query);
         int i = 0;
         if(question != null) {
            query += "question = '" + question + "'";
            if(answer != null){
                query += ",";
            }
            i++;
        }
         
         if(answer != null){
             query += "answer = '" + answer + "'";
            i++; 
         }
         
         if(question == null || answer == null){
             return false;
         }
         
        query += " where qid = " + qid;
        int row = new DBContext().getConnection().prepareStatement(query).executeUpdate();
        if(row > 0) return true;
        else return false;
         
    }
    
      public boolean DeleteQuiz(int qid) throws Exception{
        String query = "delete from Quiz where qid = " + qid;
        PreparedStatement ps = new DBContext().getConnection().prepareStatement(query);
         int row = ps.executeUpdate();
        if(row > 0) return true;
        else return false;
    }
      
      public ArrayList getLessonQuiz(int lid) throws Exception{
          String query =  "select * from Quiz where lid = " + lid;
          Connection conn = new DBContext().getConnection();
          ResultSet rs = conn.prepareStatement(query).executeQuery();
          ArrayList arr = new ArrayList();
          while (rs.next()) {  
               int qid = rs.getInt("qid");
               String question = rs.getString("question");
               String answer = rs.getString("answer");
               int id = rs.getInt("lid");
            
              Object quiz[] = {qid, question, answer, id};
              arr.add(quiz);
          }
          return  arr;
      }

    @Override
    public String toString() {
        return "Quiz{" + "qid=" + qid + ", lid=" + lid + ", question=" + question + ", answer=" + answer + '}';
    }

}
