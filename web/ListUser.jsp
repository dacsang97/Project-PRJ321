<%-- 
    Document   : ListUser
    Created on : Oct 26, 2017, 8:47:20 PM
    Author     : PhongPham
--%>

<%@page import="java.util.List"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="user" class="com.bean.UserBean" scope="request"/>
        <jsp:setProperty name="user" property="page" param="page"/>
        <jsp:setProperty name="user" property="pageSize" param="txtSize"/>
        <form action="ListUser.jsp">
            Show <select name="txtSize" onchange="document.forms[0].submit()">
                <option value="5" <c:if test="${param.txtSize == 5}">Selected</c:if>> 5</option>
                <option value="10" <c:if test="${param.txtSize == 10}">Selected</c:if>> 10</option>
                <option value="15" <c:if test="${param.txtSize == 15}">Selected</c:if>> 15</option>            
            </select> per page
            <input type="submit" value="Show"/>
        </form>
        
        <table border="1" cellspacing="0" cellpadding="15">
            <tr>
                <th>Danh sách người dùng</th>
            </tr>    
            <c:forEach var="q" items="${user.users}">
                <tr>
                    <td>${q.username}</td>
                </tr>
            </c:forEach>    
        </table>
        <p>
            <c:forEach var="i" begin="1" end="${user.totalPage}">
                <a href="ListUser.jsp?page=${i}&txtSize=${param.txtSize}">${i}</a> |
            </c:forEach>        
        </p>
    </body>
</html>
