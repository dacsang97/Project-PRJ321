<%-- 
    Document   : AdminEditUser
    Created on : Oct 30, 2017, 8:47:38 PM
    Author     : Luxury
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="AdminEditUserAction" method="post">
                Password
                <input type="password" name="newPass" />
                Re-Password
                <input type="password" name="rePass" />
                <input type="hidden" value="${param.uid}" name="uid"/>
                <input type="submit" value="Save" />
        </form>
    </body>
</html>
