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
                <div class="col-sm-12">
                    <h4 class="page-title">Nổi bật</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card-box">
                        <div class="row">
                            <div class="col-md-4 align-self-center">
                                <ul class="list-group">
                                    <li class="list-group-item description">PRJ321</li>
                                    <li class="list-group-item description">NWC202</li>
                                    <li class="list-group-item description">SWE102</li>
                                    <li class="list-group-item description">Toán học</li>
                                    <li class="list-group-item description">Tiếng Anh</li>
                                    <li class="list-group-item description">Tiếng Nhật</li>
                                    <li class="list-group-item description">Tiếng Anh</li>
                                    <li class="list-group-item description">Tiếng Nhật</li>
                                </ul>
                            </div>
                            <div class="col-md-8">
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <br />
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-block">
                            <div class="icon" style="color:#c50000!important">
                                <i class="nc-icon nc-palette"></i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Riêng biệt</h4>
                                <p class="description">Sản phẩm sẽ được tạo theo nhu cầu sử dụng của doanh nghiệp</p>
                                <a href="#pkp" class="btn btn-link btn-danger">Xem thêm</a>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-block">
                            <div class="icon" style="color:#c50000!important">
                                <i class="nc-icon nc-bulb-63"></i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Hữu ích</h4>
                                <p>Với rất nhiều những tính năng giúp tối ưu quá trình làm việc</p>
                                <a href="#pkp" class="btn btn-link btn-danger">Xem thêm</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-block">
                            <div class="icon" style="color:#c50000!important">
                                <i class="nc-icon nc-chart-bar-32"></i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Minh bạch</h4>
                                <p>Giúp cho người quản lý luôn nắm được bức tranh toàn cảnh</p>
                                <a href="#pkp" class="btn btn-link btn-danger">Xem thêm</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-block">
                            <div class="icon" style="color:#c50000!important">
                                <i class="nc-icon nc-sun-fog-29"></i>
                            </div>
                            <div class="description">
                                <h4 class="info-title">Nhanh chóng</h4>
                                <p>Giúp doanh nghiệp có được sản phẩm trong thời gian ngắn nhất</p>
                                <a href="#pkp" class="btn btn-link btn-danger">Xem thêm</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="container">

            <div class="row">
                <div class="col-md-12">
                    <h4>Đội ngũ phát triển</h4>
                </div>
                <jsp:include page="./partial/team.jsp"></jsp:include>
                </div>


            </div>
        </div>

    <%@include file="partial/footerText.jsp" %>
    <%@include file="partial/footer.jsp" %>