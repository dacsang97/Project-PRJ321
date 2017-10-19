
import com.model.Lesson;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author USER
 */
public class Main {
    static Lesson ls = new Lesson();
    public static void main(String[] args) {
        boolean b = true;
        Lesson l = new Lesson();
        try {
            //b = ls.updateLesson(10, "abcde", 3, -1);
            b = ls.deleteLesson(11);
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(b);
    }
}
