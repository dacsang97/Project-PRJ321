
<%@page import="com.model.Folder"%>
<%@page import="com.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.model.Lesson"%>
<%@page import="com.model.Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Danh sách bài học");
    %>
    <%@include file="./partial/header.jsp" %>
    <%@include file="./partial/navigation.jsp" %>


    <jsp:useBean id="folder" class="com.bean.FolderBean" scope="request"/>
    <jsp:setProperty name="folder" property="fid" param="fid"/>
    <jsp:setProperty name="folder" property="uid" value="${sessionScope.user.id}" />
    <div class="wrapper">
        <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <div class="btn-group pull-right m-t-15">
                        <button type="button" class="btn btn-custom dropdown-toggle waves-effect waves-light"
                                data-toggle="dropdown" aria-expanded="false">Settings <span class="m-l-5"><i
                                    class="fa fa-cog"></i></span></button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>

                    </div>
                    <h4 class="page-title">Chuyên mục : ${folder.folderName}</h4>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                    <div class="card-box tilebox-one">
                        <div class="row">
                            <div class="col-md-12" id="box-author">
                                <i class="zmdi zmdi-account-box pull-xs-right text-muted"></i>
                                <h6 class="text-muted text-uppercase m-b-20">Tác giả</h6>
                                <avatar username="${folder.author}" :size="50"></avatar>
                                <h4 class="m-t-10">${folder.author}</h4>
                            </div>
                        </div>
                        <hr>
                        <i class="zmdi zmdi-labels pull-xs-right text-muted"></i>
                        <h6 class="text-muted text-uppercase m-b-20">Hiện có</h6>
                        <h2 class="m-b-20" data-plugin="counterup">${folder.allLesson.size()}</h2>
                        <span class="text-muted">Bài học</span>
                        
                        <% 
                            User u = (User) session.getAttribute("user");
                            int fid = Integer.parseInt(request.getParameter("fid"));
                            Folder f = Folder.getFolder(fid);
                            if (u!=null && (u.isAdmin() || (f.getUid() == u.getId()))) {
                        %>
                        <hr>
                        <div class="flex-row" id="folder-action">
                            <div class="col-md-12 text-xs-center">
                                <div class="btn-group m-b-20 ">
                                    <a class="btn btn-sm btn-warning waves-effect waves-light" href="./EditFolder.jsp?fid=${param.fid}">
                                    <span class="btn-label"><i class="zmdi zmdi-edit"></i>
                                    </span>Chỉnh sửa</a>
                                    <button type="button" class="btn btn-sm btn-danger waves-effect waves-light"  @click="onDelete">
                                        <span class="btn-label"><i class="zmdi zmdi-delete"></i></span>Xóa
                                    </button>
                                </div>
                            </div>
                        </div>
                        <% 
                            }
                        %>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6 col-lg-6 col-xl-9">
                    <div class="card-box table-responsive">
                        <table id="datatable" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Tên</th>
                                    <th>Trạng thái</th>
                                    <th>Người tạo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="d" items="${folder.allLesson}">
                                    <tr>
                                        <td><a href="./Lesson.jsp?lid=${d.lid}">${d.title}</a></td>
                                        <td>${d.typeShare}</td>
                                        <td>${d.author}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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
    <%
        if (u != null && (u.isAdmin() || (f.getUid() == u.getId()))) {
    %>
    <script>
        new Vue({
            el: "#folder-action",
            methods: {
                onDelete() {
                    swal({
                        text: "Bạn có chắc chắn muốn xóa chuyên mục này?",
                        buttons: {
                            cancel: "Không",
                            confirm: {
                                text: "Đồng ý",
                                value: true
                            }
                        }

                    })
                            .then((value) => {
                                if (value) {
                                    axios.post("./DeleteFolderAction?fid=${param.fid}")
                                            .then(() => {
                                                swal({
                                                    icon: "success",
                                                    text: "Đã xóa bài học thành công"
                                                })
                                                .then(() => {
                                                    location.href = `./MyFolder.jsp`;
                                                })
                                            })
                                            .catch(() => {
                                                swal({
                                                    icon: "error",
                                                    text: "Có lỗi xảy ra"
                                                })
                                            })
                                }

                            })
                }
            }
        })
        
    </script>
    <%
            }
        %>
    <%@include file="partial/datatable.jsp" %>