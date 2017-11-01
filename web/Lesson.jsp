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
                    <h4 class="page-title">Bài học: ${quizs.name}</h4>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
                    <div class="card-box tilebox-one">
                        <i class="zmdi zmdi-labels pull-xs-right text-muted"></i>
                        <h6 class="text-muted text-uppercase m-b-20">Hiện có</h6>
                        <h2 class="m-b-20" data-plugin="counterup">${quizs.quizs.size()}</h2>
                        <span class="text-muted">Câu hỏi</span>
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
    <%@include file="partial/datatable.jsp" %>

