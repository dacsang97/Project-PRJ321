<%-- 
    Document   : LoginSuccess
    Created on : Oct 23, 2017, 6:33:24 PM
    Author     : USER
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
        <h1>Login xong</h1>
        <% User u = (User)session.getAttribute("user"); out.println(u.getUsername()); %>
    </body>
</html>
