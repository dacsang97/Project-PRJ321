<%--
    Document   : Folder
    Created on : Oct 24, 2017, 9:03:48 PM
    Author     : PhongPham
--%>

<%@page import="com.model.Folder"%>
<%@page import="com.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.model.Lesson"%>
<%@page import="com.model.Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="folder" class="com.bean.FolderBean" scope="request"/>
        <jsp:setProperty name="folder" property="fid" param="fid"/>
        <jsp:setProperty name="folder" property="uid" value="${sessionScope.user.id}" />
        
        <form action="Folder.jsp">
            Show <select name="txtSize" onchange="document.forms[0].submit()">
                <option value="5" <c:if test="${param.txtSize == 5}">Selected</c:if>> 5</option>
                <option value="10" <c:if test="${param.txtSize == 10}">Selected</c:if>> 10</option>
                <option value="15" <c:if test="${param.txtSize == 15}">Selected</c:if>> 15</option>            
            </select> per page
            <input type="submit" value="Show"/>
        </form>
        <jsp:setProperty name="folder" property="page" param="page"/>
        <jsp:setProperty name="folder" property="pageSize" param="txtSize"/>
        <table border="1" cellspacing="1" cellpadding="10">
            <tr>
                <th>Tên</th>
                <th>Trạng thái</th>
            </tr>
            <c:forEach var="d" items="${folder.lesson}">
                    <tr>
                        <td>${d.title}</td>
                        <td>${d.typeShare}</td>
                    </tr>
            </c:forEach>
        </table>
        <jsp:setProperty name="folder" property="size" value="${folder.size}" />
        <p>
            <c:forEach var="i" begin="1" end="${folder.totalPage}">
                <a href="Folder.jsp?page=${i}&txtSize=${param.txtSize}">${i}</a> |
            </c:forEach>        
        </p>
    </body>
</html>
