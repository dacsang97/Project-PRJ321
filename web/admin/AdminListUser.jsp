<%@page import="com.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setAttribute("title", "Trang chủ");
%>
<%@include file="./partial/header.jsp" %>

<div class="wrapper">
    <%@include file="./partial/navigation.jsp" %>

    <jsp:useBean id="dashboard" class="com.bean.Dashboard" scope="request" />
    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="content-page">
        <!-- Start content -->
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
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Danh sách thành viên</h4>
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
                                        <th>ID</th>
                                        <th>Tên</th>
                                        <th>Quyền</th>
                                        <th>Chỉnh sửa</th>
                                        <th>Xóa</th>
                                    </tr> 
                                </thead>
                                <tbody>
                                    <c:forEach var="q" items="${user.allUsers}">
                                        <tr>
                                            <td>${q.id}</td>
                                            <td>${q.username}</td>
                                            <td>${q.permission == 1?"Quản trị viên":"Thành viên"}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${q.id!=1}">
                                                        <c:url var="u" value="AdminEditUser.jsp">
                                                            <c:param name="uid" value="${q.id}"/>
                                                        </c:url> 
                                                    </c:when>
                                                </c:choose>                   
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
                                                <c:choose>
                                                    <c:when test="${q.id!=1}">
                                                        <c:url var="u" value="AdminDeleteUserAction">
                                                            <c:param name="uid" value="${q.id}"/>
                                                        </c:url> 
                                                    </c:when>
                                                </c:choose> 
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
