<%-- 
    Document   : Register
    Created on : Oct 23, 2017, 9:36:03 PM
    Author     : PhongPham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="RegisterAction" method="post">
            User
            <input type="text" name="name"/>
            <p>
            Pass
            <input type="password" name="password" />
            <p>
            Re-Pass
            <input type="password" name="re_password" />
            <p>
            <input type="submit" value="Register" />
        </form>
    </body>
</html>
