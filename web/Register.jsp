<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <% request.setAttribute("title", "Đăng kí");
       %>
    <%@include file="./partial/header.jsp" %>
    <div class="account-pages"></div>
    <div class="clearfix"></div>
    <div class="wrapper-page">

        <div class="account-bg">
            <div class="card-box m-b-0">
                <div class="text-xs-center m-t-20">
                    <a href="index.html" class="logo">
                        <i class="ti-ruler-alt-2"></i>
                        <span>${initParam.sitename}</span>
                    </a>
                </div>
                <div class="m-t-10 p-20">
                    <div class="row">
                        <div class="col-xs-12 text-xs-center">
                            <h6 class="text-muted text-uppercase m-b-0 m-t-0">Đăng kí</h6>
                        </div>
                    </div>
                    <form class="m-t-20" action="RegisterAction" method="POST">
                        <div class="form-group row">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" name="name" required="" placeholder="Tài khoản">
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-xs-12">
                                <input class="form-control" type="password" name="password" required="" placeholder="Mật khẩu">
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <div class="col-xs-12">
                                <input class="form-control" type="password" name="re_password" required="" placeholder="Nhập lại mật khẩu">
                            </div>
                        </div>

                        <div class="form-group row text-center m-t-10">
                            <div class="col-xs-12">
                                <button class="btn btn-success btn-block waves-effect waves-light" type="submit">Đăng kí ngay</button>
                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>
        <!-- end card-box-->

        <div class="m-t-20">
            <div class="text-xs-center">
                <p class="text-white">Bạn đã có tài khoản? <a href="./Login.jsp" class="text-white m-l-5"><b>Đăng nhập</b> </a></p>
            </div>
        </div>

    </div>

    <%@include file="partial/footer.jsp" %>
