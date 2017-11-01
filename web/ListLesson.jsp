<%@page import="com.model.User"%>
<%@page import="com.model.Quiz"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Folder"%>
<%@page import="java.util.List"%>
<%@page import="com.model.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Danh sách bài học");
    %>
    <%@include file="./partial/header.jsp" %>
    <%@include file="./partial/navigation.jsp" %>


    <jsp:useBean id="lesson" class="com.bean.LessonBean" scope="request"/>
    <jsp:setProperty name="lesson" property="user" value="${sessionScope.user}"/>
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
                    <h4 class="page-title">Danh sách bài học</h4>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                    <div class="card-box tilebox-one">
                        <i class="zmdi zmdi-shape pull-xs-right text-muted"></i>
                        <h6 class="text-muted text-uppercase m-b-20">Hiện có</h6>
                        <h2 class="m-b-20" data-plugin="counterup">${lesson.allLessons.size()}</h2>
                        <span class="text-muted">Bài học</span>
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

                                <c:forEach var="l" items="${lesson.allLessons}">
                                    <tr>
                                        <td><a href="./Lesson.jsp?lid=${l.lid}">${l.title}</a></td>
                                        <td>${l.typeShare}</td>
                                        <td>${l.userName}</td>
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
    <%@include file="partial/datatable.jsp" %>