<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="./partial/header.jsp" %>
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-12">
                <h4>Nổi bật</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <ul class="list-group">
                    <li class="list-group-item description">Cras justo odio</li>
                    <li class="list-group-item description">Dapibus ac facilisis in</li>
                    <li class="list-group-item description">Morbi leo risus</li>
                    <li class="list-group-item description">Porta ac consectetur ac</li>
                    <li class="list-group-item description">Vestibulum at eros</li>
                    <li class="list-group-item description">Porta ac consectetur ac</li>
                </ul>
            </div>
            <div class="col-md-8 align-items-center">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img class="d-block" src="assets/img/slider_1.jpg" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block" src="assets/img/slider_2.jpg" alt="Second slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <i class="now-ui-icons arrows-1_minimal-left"></i>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <i class="now-ui-icons arrows-1_minimal-right"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h4>Đội ngũ phát triển</h4>
            </div>
            <jsp:include page="./partial/team.jsp"></jsp:include>
        </div>
    </div>        
    <%@include file="partial/footer.jsp" %>