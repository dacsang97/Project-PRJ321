<%-- 
    Document   : AdminCreateLesson
    Created on : Oct 30, 2017, 3:06:08 PM
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
        <form action="AdminCreateLessonAction" method="post">
            <p>Title<input type="text" name="title"/>
            <p>Share <input type="text" name="share"/>
            <p><input type="submit" value="OK"/>
        </form>
    </body>
</html>
