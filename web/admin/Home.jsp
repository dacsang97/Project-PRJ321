<%-- 
    Document   : Home
    Created on : Oct 23, 2017, 10:07:03 PM
    Author     : PhongPham
--%>

<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            Not administrator 
            ${sessionScope.LoginError.username}
        </h1>
    </body>
</html>
