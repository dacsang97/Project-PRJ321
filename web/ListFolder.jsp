<%-- 
    Document   : ListFolder
    Created on : Oct 24, 2017, 9:32:42 PM
    Author     : TuanManh
--%>

<%@page import="com.model.Folder"%>
<%@page import="java.util.List"%>
<%@page import="com.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            User u = (User)session.getAttribute("user");
            if(u == null){
                List<Folder> f = Folder.getListFolder(null, -1, 3);
                
            }
//            else{
//                List<Folder> f = Folder.getListFolder(u.getUsername(), u.getId(), 3);
//            }
            %>
        
    </body>
</html>
