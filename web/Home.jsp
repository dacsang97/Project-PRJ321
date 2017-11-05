<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Trang chủ");
    %>
    <%@include file="./partial/header.jsp" %>
    <%@include file="./partial/navigation.jsp" %>
    <jsp:useBean id="quizs" class="com.bean.QuizBean" scope="request"/>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h4 class="page-title">Nổi bật</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-md-6 col-lg-6 col-xl-4">
                    <div class="card-box tilebox-one">
                        <button type="button" class="btn btn-lg btn-block btn-success-outline waves-effect waves-light text-xs-left m-b-1">
                            <span class="pull-right">
                                <i class="zmdi zmdi-boat"></i>
                            </span>
                            PRJ321
                        </button>
                        <button type="button" class="btn btn-lg btn-block btn-primary-outline waves-effect waves-light text-xs-left m-b-1">
                            <span class="pull-right">
                                <i class="zmdi zmdi-boat"></i>
                            </span>
                            SWE102
                        </button>
                        <button type="button" class="btn btn-lg btn-block btn-danger-outline waves-effect waves-light text-xs-left m-b-1">
                            <span class="pull-right">
                                <i class="zmdi zmdi-boat"></i>
                            </span>
                            NWC102
                        </button>
                        <button type="button" class="btn btn-lg btn-block btn-warning-outline waves-effect waves-light text-xs-left m-b-1">
                            <span class="pull-right">
                                <i class="zmdi zmdi-boat"></i>
                            </span>
                            JPD121
                        </button>
                        <button type="button" class="btn btn-lg btn-block btn-purple-outline waves-effect waves-light text-xs-left m-b-1">
                            <span class="pull-right">
                                <i class="zmdi zmdi-boat"></i>
                            </span>
                            Lab Java Desktop
                        </button>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card-box tilebox-one">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
                            </ol>
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active">
                                    <img class="d-block d-block img-fluid" src="assets/img/slider_1.jpg" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block d-block img-fluid" src="assets/img/slider_2.jpg" alt="Second slide">
                                </div>
                                <a href="#carouselExampleIndicators" role="button" data-slide="prev" class="left carousel-control"> <span aria-hidden="true" class="fa fa-angle-left"></span> <span class="sr-only">Previous</span> </a>
												<a href="#carouselExampleIndicators" role="button" data-slide="next" class="right carousel-control"> <span aria-hidden="true" class="fa fa-angle-right"></span> <span class="sr-only">Next</span> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <h4 class="page-title">Nhà phát triển nội dung</h4>
                </div>
            </div>
            <div class="row">
                <jsp:include page="./partial/team.jsp"></jsp:include>
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