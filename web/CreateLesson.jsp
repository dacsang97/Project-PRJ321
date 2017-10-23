<%-- 
    Document   : CreateLesson
    Created on : Oct 23, 2017, 9:36:27 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="CreateLessonAction" method="post">
            <p>Title<input type="text" name="title"/>
            <p>Share <input type="text" name="share"/>
            <p><input type="submit" value="OK"/>
        </form>
    </body>
</html>
