<%--
    Document   : Folder
    Created on : Oct 24, 2017, 9:03:48 PM
    Author     : PhongPham
--%>

<%@page import="com.model.Folder"%>
<%@page import="com.model.User"%>
<%@page import="java.util.List"%>
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
        <jsp:useBean id="folder" class="com.bean.FolderBean" scope="request"/>
        <jsp:setProperty name="folder" property="fid" param="fid"/>
        <jsp:setProperty name="folder" property="uid" value="${sessionScope.user.id}" />
        <table>
            <tr>
                <th>Question</th>
                <th>Answer</th>
            </tr>
            <c:forEach var="d" items="${folder.lesson}">
                    <tr>
                        <td>${d.title}</td>
                        <td>${d.typeShare}</td>
                    </tr>
            </c:forEach>
        </table>
    </body>
</html>
