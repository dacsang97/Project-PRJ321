<%-- 
    Document   : AdminCreateUser
    Created on : Oct 30, 2017, 11:46:25 PM
    Author     : Luxury
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>    
        Username: <input type="text" name="txtName"/>
        <p>Password: <input type="password" name="txtPassword">
        <p>Re-Password: <input type="passowrd" name="txtRePassword"/>
        <p><c:choose>
            <c:when test="${param.uid == 1}">
                <select>
                    <option>Quản trị viên</option>
                    <option>Thành viên</option>
                </select>
            </c:when>
        </c:choose>
        <p>
        <form action="">
            <input type="submit" value="Create"/>
        </form>  
    </body>
</html>
