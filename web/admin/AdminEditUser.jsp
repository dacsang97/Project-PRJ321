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
    <%
        int params = (Integer.parseInt(request.getParameter("uid")));
        User user = (User) session.getAttribute("user");
        User x = User.getUser(params);
        boolean kt = x.isAdmin();
        if (x == null) {
            response.sendRedirect("./AdminListUser.jsp");
        } else if (params == 1 && user.getId() == 1) {
            response.sendRedirect("./AdminListUser.jsp");
        } else if (x.isAdmin() && user.getId() != 1) {
            response.sendRedirect("./AdminListUser.jsp");
        }
        request.setAttribute("user", x);
        request.setAttribute("userID", user.getId());
        request.setAttribute("kt", kt);
    %>
    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Thành viên ${user.username}</h4>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card-box text-xs-center" id="box-author">
                            <avatar username="${user.username}" :size="100"></avatar>
                            <h3 class="m-t-2 m-b-2">${user.username}</h3>
                            <% if (kt) { %>
                            <button type="button" class="btn btn-danger btn-rounded waves-effect waves-light">
                                <span class="btn-label"><i class="zmdi zmdi-shield-security"></i>
                                </span>Quản trị viên</button>
                                <% } else { %>
                            <button type="button" class="btn btn-info btn-rounded waves-effect waves-light">
                                <span class="btn-label"><i class="zmdi zmdi-account"></i>
                                </span>Thành viên</button>
                                <% }%>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card-box">
                            <form action="AdminEditUserAction" method="post">
                                <fieldset class="form-group">
                                    <label>Tên tài khoản</label>
                                    <input type="text" class="form-control" value="${user.username}" disabled>
                                </fieldset>
                                <fieldset class="form-group">
                                    <label>Mật khẩu</label>
                                    <input type="password" name="newPass" class="form-control">
                                </fieldset>
                                <fieldset class="form-group">
                                    <label>Nhập lại mật khẩu</label>
                                    <input type="password" name="rePass" class="form-control">
                                </fieldset>
                                <input type="hidden" value="${param.uid}" name="uid"/>          
                                <c:choose>
                                    <c:when test="${userID == 1}">
                                        <fieldset class="form-group">
                                            <label>Quyền</label>
                                            <select class="form-control" name="state">
                                                <option value="2">${!kt?"Thành viên":"Quản trị viên"}</option>   
                                                <option value="1">${kt?"Thành viên":"Quản trị viên"}</option> 
                                            </select>
                                        </fieldset>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>
                                </c:choose>
                                <button type="submit" class="btn btn-success waves-effect waves-light">Cập nhật</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>



    </div>

    <%@include file="./partial/footer.jsp" %>
    <script>
        new Vue({
            el: "#box-author",
            components: {
                'avatar': Avatar.Avatar
            }
        })
    </script>
</div>


</body>
</html>
