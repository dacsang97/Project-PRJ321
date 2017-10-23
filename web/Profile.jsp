<%-- 
    Document   : Profile
    Created on : Oct 23, 2017, 11:04:19 PM
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
        <table border="1" cellspacing="0" cellpadding="10">
            <tr>
                <th>Username</th>
                <th>Permission</th>
                <th>Change Password</th>
            </tr>
            <tr>
                <td>${sessionScope.user.username}</td>
                <td>${sessionScope.user.permission}</td>
                <td><a href="EditProfile.jsp">Edit</a></td>
            </tr>
        </table>
    </body>
</html>
