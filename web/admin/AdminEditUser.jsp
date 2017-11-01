<%-- 
    Document   : AdminEditUser
    Created on : Oct 30, 2017, 8:47:38 PM
    Author     : Luxury
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            int params = (Integer.parseInt(request.getParameter("uid")));
            User user = (User) session.getAttribute("user");
            User x = User.getUser(params);
            boolean kt = x.isAdmin();
            if(x == null){
                response.sendRedirect("./AdminListUser.jsp");
            } else if (params == 1 && user.getId() == 1) {
                response.sendRedirect("./AdminListUser.jsp");
            } else if(x.isAdmin() && user.getId() != 1){
                response.sendRedirect("./AdminListUser.jsp");
            }
            request.setAttribute("userID", user.getId());
            request.setAttribute("kt", kt);
        %>
        <form action="AdminEditUserAction" method="post">
            Password
            <input type="password" name="newPass" />
            Re-Password
            <input type="password" name="rePass" />
            <input type="hidden" value="${param.uid}" name="uid"/>          
            <c:choose>
                <c:when test="${userID == 1}">
                    <select name="state">
                        <option value="2">${!kt?"Thành viên":"Quản trị viên"}</option>   
                        <option value="1">${kt?"Thành viên":"Quản trị viên"}</option> 
                    </select>
                </c:when>
                <c:otherwise>
                </c:otherwise>
            </c:choose>
            <input type="submit" value="Save" />
        </form>
    </body>
</html>
