<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Trang chủ");
    %>
    <%@include file="./partial/header.jsp" %>
    <%@include file="./partial/navigation.jsp" %>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card-box tilebox-one">
                        <i class="icon-rocket pull-xs-right text-muted"></i>
                        <h6 class="text-muted text-uppercase m-b-20">Thông tin thành viên</h6>
                        <%
                            User u = (User) session.getAttribute("user");
                            if (u.isAdmin()) {
                        %>
                        <span class="label label-danger"> Quản trị viên </span>
                        <% } else { %>
                        <span class="label label-success"> Thành viên </span>
                        <% }%>
                        <h2 class="m-b-20">${sessionScope.user.username}</h2>

                        <hr />
                        <div class="row">
                            <div class="col-md-6">
                                <h2 class="m-b-20" data-plugin="counterup">1,890</h2>
                                Bài học
                            </div>
                            <div class="col-md-6">
                                <h2 class="m-b-20" data-plugin="counterup">1,890</h2>
                                Chuyên mục
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <%@include file="partial/footer.jsp" %>
    <script>
        new Vue({
            el: "#menu-extras",
            components: {
                'avatar': Avatar.Avatar
            }
        })
    </script>