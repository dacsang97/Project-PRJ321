<%@page import="com.model.Lesson"%>
<%@page import="com.model.Folder"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Trang chủ");
    %>

    <%@include file="./partial/header.jsp" %>
    <%@include file="./partial/navigation.jsp" %>
    <% User u = (User) session.getAttribute("user"); %>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="card-box tilebox-one">
                                <i class="zmdi zmdi-storage pull-xs-right text-muted"></i>
                                <h1 class="m-b-20" data-plugin="counterup"><% out.println(Folder.getCountFolder(u.getId())); %></h1>
                                <h6 class="text-muted text-uppercase m-b-20">Chuyên mục</h6>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="card-box tilebox-one">
                                <i class="zmdi zmdi-shape pull-xs-right text-muted"></i>
                                <h1 class="m-b-20"><span data-plugin="counterup"><% out.println(Lesson.getCountLesson(u.getId()));%></span></h1>
                                <h6 class="text-muted text-uppercase m-b-20">Bài học</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card-box tilebox-one">
                        <i class="icon-rocket pull-xs-right text-muted"></i>
                        <h6 class="text-muted text-uppercase m-b-20">Thông tin thành viên</h6>
                        <div class="row">
                            <div class="col-md-6 text-xs-center" id="box-author">
                                <div class="card">
                                    <div class="card-block">
                                        <div class="m-b-1">
                                            <avatar username="${sessionScope.user.username}" :size="100"></avatar>
                                        </div>
                                        <hr>
                                        <h2 class="m-t-1">${sessionScope.user.username}</h2>
                                        <%
                                            if (u.isAdmin()) {
                                        %>
                                        <span class="label label-danger"> Quản trị viên </span>
                                        <% } else { %>
                                        <span class="label label-success"> Thành viên </span>
                                        <% }%>
                                        
                                    </div>

                                </div>

                            </div>
                            <div class="col-md-6">
                                <form action="EditProfileAction" method="post">
                                    <fieldset class="form-group">
                                        <label>Mật khẩu hiện tại</label>
                                        <input type="password" class="form-control" name="oldPass">
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <label>Mật khẩu mới</label>
                                        <input type="password" class="form-control" name="newPass">
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <label>Nhập lại mật khẩu</label>
                                        <input type="password" class="form-control" name="rePass">
                                    </fieldset>
                                    <button type="submit" class="btn btn-danger waves-effect waves-light">Cập nhật</button>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>

    </div>
    <%@include file="partial/footerText.jsp" %>
    <%@include file="partial/footer.jsp" %>
    <script>
        new Vue({
            el: "#menu-extras",
            components: {
                'avatar': Avatar.Avatar
            }
        })
        new Vue({
            el: "#box-author",
            components: {
                'avatar': Avatar.Avatar
            }
        })
    </script>