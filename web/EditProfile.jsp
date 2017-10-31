
<%-- 
    Document   : EditProfile
    Created on : Oct 23, 2017, 11:17:07 PM
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
        <%
        String s = (String) session.getAttribute("LoginError");
        if (s.equals("error")) {%>
        <h1>Bạn chưa đăng nhập</h1>
        <%} else {%>    
            <form action="EditProfileAction" method="post">
                Old Password
                <input type="password" name="oldPass" />
                Password
                <input type="password" name="newPass" />
                Re-Password
                <input type="password" name="rePass" />
                <input type="submit" value="Save" />
            </form>
        <%}%>
    </body>
</html>
