<%@page import="com.model.User"%>
<%@page import="com.model.Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Folder"%>
<%@page import="java.util.List"%>
<%@page import="com.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setAttribute("title", "Danh sách chuyên mục");
%>
<%@include file="./partial/header.jsp" %>

<div class="wrapper">
    <%@include file="./partial/navigation.jsp" %>
    <div class="content-page">
        <jsp:useBean id="folder" class="com.bean.ListFolderBean" scope="request"/>
        <jsp:useBean id="user" class="com.bean.UserBean" scope="request"/>
        <jsp:setProperty name="folder" property="user" value="${sessionScope.user}"/>
        <jsp:setProperty name="folder" property="pageSize" param="txtSize"/>
        <jsp:setProperty name="folder" property="page" param="page"/>

        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Danh sách chuyên mục</h4>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-6 col-lg-6 col-xl-12">
                        <div class="card-box table-responsive">
                            <table id="datatable" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Tên</th>
                                        <th>Trạng thái</th>
                                        <th>Tác giả</th>
                                        <th>Chỉnh sửa</th>
                                        <th>Xóa</th>
                                    </tr> 
                                </thead>
                                <tbody>
                                    <c:forEach var="l" items="${folder.listAllFolder}">
                                        <tr>
                                            <td><a href="../Folder.jsp?fid=${l.fid}">${l.name}</a></td>
                                            <td>${l.typeShare}</td>
                                            <td>${l.author}</td>                  
                                            <td>
                                                <c:url var="update" value="AdminEditFolder.jsp">
                                                    <c:param name="fid" value="${l.fid}" />
                                                    <c:param name="name" value="${l.name}" />
                                                    <c:param name="sharefolder" value="${l.sharefolder}" />

                                                </c:url>
                                                <a href="${update}">Chỉnh sửa</a>
                                            </td>
                                            <td><a href="DeleteFolderAction?fid=${l.fid}">Xóa</a></td>


                                        </tr>
                                    </c:forEach> 
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <%@include file="./partial/footer.jsp" %>
    <%@include file="partial/datatable.jsp" %>
</div>


</body>
</html>
