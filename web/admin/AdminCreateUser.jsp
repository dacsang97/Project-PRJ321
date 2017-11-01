<%-- 
    Document   : AdminCreateUser
    Created on : Oct 30, 2017, 11:46:25 PM
    Author     : Luxury
--%>

<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>  
        <%
            User user = (User) session.getAttribute("user");
            int userID = user.getId();
            request.setAttribute("userID", user.getId());
        %>
        <form action="AdminCreateUserAction" method="Post">
            Username: <input type="text" name="username"/>
            <p>Password: <input type="password" name="newPass">
            <p>Re-Password: <input type="password" name="rePass"/>
            <p><c:choose>
                <c:when test="${userID == 1}">
                    <select name="state">
                        <option value="2">Thành viên</option>
                        <option value="1">Quản trị viên</option>                  
                    </select>
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="state" value="2"/>
                </c:otherwise>
            </c:choose>
            <p>
                <input type="submit" value="Create"/>
        </form>  
    </body>
</html>
