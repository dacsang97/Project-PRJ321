<%-- 
    Document   : AdminEditFolder
    Created on : Oct 30, 2017, 3:39:44 PM
    Author     : TuanManh
--%>

<%@page import="com.model.Folder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EditFolderAdmin</title>
    </head>
    <body>
       
        <h1>Update Folder</h1>
        <form action="EditFolderAction" method="post">
        
            <table >
                <tr>
                    <td>Folder Id</td>
                    <td><input type="text" name="fid" value="${param.fid}"></td>
                </tr>
                
                <tr>
                    <td>Folder Name</td>
                    <td><input type="text" name="name" value="${param.name}"></td>
                </tr>
                
                <tr>
                    <td>Folder ShareFolder</td>
                    <td><input type="text" name="sharefolder" value="${param.sharefolder}"></td>
                </tr>
                
                <tr>
                    <td colspan="2"><button type="submit" name="submit">Update</button></td>
                </tr>
            </table>
        </form>
    </body>
</html>
