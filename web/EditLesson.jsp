<%-- 
    Document   : EditLesson
    Created on : Oct 29, 2017, 10:18:07 PM
    Author     : USER
--%>

<%@page import="com.model.Lesson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                int lid = Integer.parseInt(request.getParameter("lid"));
                Lesson l = Lesson.getLesson(lid);
                request.setAttribute("lesson", l);
        %>
        <form action="EditLessonAction" method="post">
            <input type="hidden" name="lid" value="${param.lid}"/>
            <p>Tên<input type="text" name="title" value="${lesson.title}" />
            <p>Trạng thái<select name="share">
                    <option value="1" <c:if test="${lesson.share == 1}">selected</c:if>>Chỉ mình tôi</option>
                    <option value="2" <c:if test="${lesson.share == 2}">selected</c:if>>Thành viên</option>
                    <option value="3" <c:if test="${lesson.share == 3}">selected</c:if>>Công khai</option>
                </select>
            <p><input type="submit" value="OK" />
        </form>    
        <%
            } catch(Exception e) {
                
            }
        %>
        
    </body>
</html>
