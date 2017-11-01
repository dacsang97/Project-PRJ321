<%-- 
    Document   : EditFolder
    Created on : Nov 1, 2017, 5:41:17 PM
    Author     : USER
--%>

<%@page import="com.model.Folder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int fid = Integer.parseInt(request.getParameter("fid"));
            Folder f = Folder.getFolder(fid);
            session.setAttribute("folder", f);
        %>
        <form action="EditFolderAction" method="POST">
            <input type="hidden" name="fid" value="${param.fid}"/>
            <p>Tên<input type="text" name="name" value="${folder.name}" />
            <p>Trạng thái<select name="shareFolder">
                    <option value="1" <c:if test="${folder.sharefolder == 1}">selected=""</c:if>>Chỉ mình tôi</option>
                    <option value="2" <c:if test="${folder.sharefolder == 2}">selected=""</c:if>>Thành viên</option>
                    <option value="3" <c:if test="${folder.sharefolder == 3}">selected=""</c:if>>Công khai</option>
                </select>
            <p><input type="submit" value="OK" />
        </form>
    </body>
</html>
