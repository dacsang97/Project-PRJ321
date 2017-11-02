<%@page import="com.model.User"%>
<%@page import="com.model.Lesson"%>
<%@page import="com.model.Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Danh sách câu hỏi");
    %>
    <%@include file="./partial/header.jsp" %>
    <%@include file="./partial/navigation.jsp" %>


    <jsp:useBean id="quizs" class="com.bean.QuizBean" scope="request"/>
    <jsp:setProperty name="quizs" property="lid" value="${param.lid}"/>
    <div class="wrapper">
        <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <h4 class="page-title">Bài học: ${quizs.name}</h4>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                    <div class="card-box tilebox-one">
                        <div class="row">
                            <div class="col-md-12" id="box-author">
                                <i class="zmdi zmdi-account-box pull-xs-right text-muted"></i>
                                <h6 class="text-muted text-uppercase m-b-20">Tác giả</h6>
                                <avatar username="${quizs.author}" :size="50"></avatar>
                                <h4 class="m-t-10">${quizs.author}</h4>
                            </div>
                        </div>
                        <hr>
                        <i class="zmdi zmdi-labels pull-xs-right text-muted"></i>
                        <h6 class="text-muted text-uppercase m-b-20">Hiện có</h6>
                        <h2 class="m-b-20" data-plugin="counterup">${quizs.quizs.size()}</h2>
                        <span class="text-muted">Câu hỏi</span>

                        <%
                            User u = (User) session.getAttribute("user");
                            int lid = Integer.parseInt(request.getParameter("lid"));
                            Lesson l = Lesson.getLesson(lid);
                            if (u != null && (u.isAdmin() || (l.getUid() == u.getId()))) {
                        %>
                        <hr>
                        <div class="flex-row" id="lesson-action">
                            <div class="col-md-12 text-xs-center">
                                <div class="btn-group m-b-20 ">
                                    <a class="btn btn-sm btn-warning waves-effect waves-light" href="./EditLesson.jsp?lid=${param.lid}">
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
                                    <th>Câu hỏi</th>
                                    <th>Trả lời</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="d" items="${quizs.quizs}">
                                    <tr>
                                        <td>${d.question}</td>
                                        <td>${d.answer}</td>
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
    </script>
    <script>
        new Vue({
            el: "#box-author",
            components: {
                'avatar': Avatar.Avatar
            }
        })
    </script>
    <%
        if (u != null && (u.isAdmin() || (l.getUid() == u.getId()))) {
    %>
    <script>
        new Vue({
            el: "#lesson-action",
            methods: {
                onDelete() {
                    swal({
                        text: "Bạn có chắc chắn muốn xóa bài học này?",
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
                                    axios.post("./DeleteLessonAction?lid=${param.lid}")
                                            .then(() => {
                                                swal({
                                                    icon: "success",
                                                    text: "Đã xóa bài học thành công"
                                                })
                                                .then(() => {
                                                    location.href = `./MyLesson.jsp`;
                                                })
                                            })
                                }

                            })
                    let x = 'href="./DeleteLesson.jsp?lid=${param.lid}"'
                }
            }
        })
        <%
            }
        %>
    </script>
    <%@include file="partial/datatable.jsp" %>

