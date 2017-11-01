<%-- 
    Document   : AdminListUser
    Created on : Oct 30, 2017, 8:23:29 PM
    Author     : Luxury
--%>

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
        <%
            User userX = (User) session.getAttribute("user");
            int userID = -1;
            if (userX != null) {
                userID = userX.getId();
            }
            request.setAttribute("uid", userID);
        %>
        <form action="./AdminListUser.jsp">
            Show <select name="txtSize" onchange="document.forms[0].submit()">
                <option value="5" <c:if test="${param.txtSize == 5}">Selected</c:if>> 5</option>
                <option value="10" <c:if test="${param.txtSize == 10}">Selected</c:if>> 10</option>
                <option value="15" <c:if test="${param.txtSize == 15}">Selected</c:if>> 15</option>            
                </select> per page
                <input type="submit" value="Show"/>
            </form>
            <p>
            <form action="./AdminCreateUser.jsp">
                <input type="submit" value="Create New User">
            </form>              
            <p>
            <table border="1" cellspacing="0" cellpadding="15">
                <tr>
                    <th>ID</th>
                    <th>Tên</th>
                    <th>Quyền</th>
                </tr>    
            <c:forEach var="q" items="${user.users}">
                <tr>
                    <td>${q.id}</td>
                    <td>${q.username}</td>
                    <td>${q.permission == 1?"Quản trị viên":"Thành viên"}</td>
                    <td>
                        <c:url var="u" value="AdminEditUser.jsp">
                            <c:param name="uid" value="${q.id}"/>
                        </c:url>                    
                        <c:choose>                          
                            <c:when test="${uid==1}">
                                <a href="${u}">${q.id != 1?"Chỉnh sửa":""}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${u}">${q.id != 1 && q.permission!=1?"Chỉnh sửa":""}</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:url var="u" value="AdminDeleteUserAction">
                            <c:param name="uid" value="${q.id}"/>
                        </c:url>
                        <c:choose>                          
                            <c:when test="${uid==1}">
                                <a href="${u}">${q.id != 1?"Xóa":""}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${u}">${q.id != 1 && q.permission!=1?"Xóa":""}</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>    
        </table>
        <p>
            <c:forEach var="i" begin="1" end="${user.totalPage}">
                <a href="./AdminListUser.jsp?page=${i}&txtSize=${param.txtSize}">${i}</a> |
            </c:forEach>        
        </p>
    </body>
</html>
