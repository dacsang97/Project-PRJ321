<%-- 
    Document   : ListLesson
    Created on : Oct 25, 2017, 7:46:24 PM
    Author     : USER
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Product.jsp">
            Show <select name="txtSize" onchange="document.forms[0].submit()">
                <option value="5" <c:if test="${param.txtSize == 5}">Selected</c:if>>5 </option>
                <option value="10"<c:if test="${param.txtSize == 10}">Selected</c:if>>10</option>
                <option value="15" <c:if test="${param.txtSize == 15}">Selected</c:if>>15</option>
            </select> per page
        </form>
        <jsp:useBean id="lesson" class="com.bean.LessonBean" scope="request"/>
        <jsp:setProperty name="lesson" property="user" value="${sessionScope.user}"/>
        <jsp:setProperty name="lesson" property="pageSize" param="txtSize"/>
        <jsp:setProperty name="lesson" property="page" param="page"/>
        <table>
            <tr>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="l" items="${lesson.lessons}">
                <tr>
                    <td></td>
                    <td></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
