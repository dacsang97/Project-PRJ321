<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="AdminCreateFolderAction" method="POST">
            <p>Tên<input type="text" name="name" value="" />
            <p>Trạng thái<select name="shareFolder">
                <option value="1">Chỉ mình tôi</option>
                <option value="2">Thành viên</option>
                <option value="3">Công khai</option>
            </select>
            <p><input type="submit" value="OK" />
        </form>
    </body>
</html>
