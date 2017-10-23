<%-- 
    Document   : Login
    Created on : Oct 19, 2017, 8:32:25 PM
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
        <form action="LoginAction" method="post">
            User
            <input type="text" name="name"/>
            Pass
            <input type="password" name="password" />
            <input type="submit" value="submit" />
        </form>
    </body>
</html>
