<%-- 
    Document   : AdminListFolder
    Created on : Oct 29, 2017, 10:08:46 PM
    Author     : TuanManh
--%>

<%@page import="com.model.User"%>
<%@page import="com.model.Quiz"%>
<%@page import="java.util.ArrayList"%>
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
       <form action="AdminListFolder.jsp">
             Show <select name="txtSize" onchange="document.forms[0].submit()">
                <option value="5" <c:if test="${param.txtSize == 5}">Selected</c:if>>5 </option>
                <option value="10"<c:if test="${param.txtSize == 10}">Selected</c:if>>10</option>
                <option value="15"<c:if test="${param.txtSize == 15}">Selected</c:if>>15</option>
            </select> 
        </form>
            
        <jsp:useBean id="folder" class="com.bean.ListFolderBean" scope="request"/>
        <jsp:useBean id="user" class="com.bean.UserBean" scope="request"/>
        <jsp:setProperty name="folder" property="user" value="${sessionScope.user}"/>
        <jsp:setProperty name="folder" property="pageSize" param="txtSize"/>
        <jsp:setProperty name="folder" property="page" param="page"/>
        
        <table border="1">
            <tr>
                <th>Name</th>
                <th>TypeShare</th>
                <th>Author</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            <c:forEach var="l" items="${folder.listfolder}">
                <tr>
                    <td>${l.name}</td>
                    <td>${l.typeShare}</td>
                    <td>${l.author}</td>                  
<!--                    <td><a href="AdminEditFolder.jsp?fid=${l.fid}">Update</a></td>-->
                    
                        <td>
                                <c:url var="update" value="AdminEditFolder.jsp">
                                     <c:param name="fid" value="${l.fid}" />
                                     <c:param name="name" value="${l.name}" />
                                     <c:param name="sharefolder" value="${l.sharefolder}" />
                                   
                                </c:url>
                              <a href="${update}">Update</a>
                        </td>
                    <td><a href="DeleteFolderAction?fid=${l.fid}">Delete</a></td>
               
                    
                </tr>
            </c:forEach>
        </table>
        
         <p>
            <c:forEach var="i" begin="1" end="${folder.totalPage}">
                <a href="ListFolder.jsp?page=${i}&txtSize=${param.txtSize}">${i}</a> 
            </c:forEach>        
        </p>
        Size: ${folder.size}
    </body>
</html>
