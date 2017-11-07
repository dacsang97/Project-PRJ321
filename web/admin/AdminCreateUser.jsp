<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setAttribute("title", "Danh sách chuyên mục");
%>
<%@include file="./partial/header.jsp" %>

<div class="wrapper">
    <%@include file="./partial/navigation.jsp" %>
    <div class="content-page">
        <%
            User user = (User) session.getAttribute("user");
            int userID = user.getId();
            request.setAttribute("userID", user.getId());
        %>
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Tạo thành viên mới</h4>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="card-box table-responsive">
                            <form action="AdminCreateUserAction" method="Post">
                                <fieldset class="form-group">
                                    <label>Tên tài khoản</label>
                                    <input type="text" class="form-control" name="username">
                                </fieldset>
                                <fieldset class="form-group">
                                    <label>Mật khẩu</label>
                                    <input type="password" class="form-control" name="newPass">
                                </fieldset>
                                <fieldset class="form-group">
                                    <label>Nhập lại mật khẩu</label>
                                    <input type="password" class="form-control" name="rePass">
                                </fieldset>
                                <p><c:choose>
                                        <c:when test="${userID == 1}">
                                        <fieldset class="form-group">
                                            <label>Quyền</label>
                                            <select class="form-control" name="state">
                                                <option value="2">Thành viên</option>
                                                <option value="1">Quản trị viên</option>                  
                                            </select>
                                        </fieldset>

                                    </c:when>
                                    <c:otherwise>
                                        <input type="hidden" name="state" value="2"/>
                                    </c:otherwise>
                                </c:choose>
                                <button type="submit" class="btn btn-primary waves-effect waves-light">Tạo</button>
                            </form>  
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
