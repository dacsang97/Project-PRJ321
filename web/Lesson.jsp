
<%-- 
    Document   : Lesson
    Created on : Oct 23, 2017, 10:01:08 PM
    Author     : USER
--%>

<%@page import="com.model.User"%>
<%@page import="com.model.Lesson"%>
<%@page import="com.model.Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <p>${user.id}
        <table>
            <tr>
                <th>Question</th>
                <th>Answer</th>
            </tr>
            <c:forEach var="d" items="${quizs}">
                <tr>
                    <td>${d.question}</td>
                    <td>${d.answer}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

